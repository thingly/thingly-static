+++
title = "Mystery: Revealed"
date = "2017-08-31"
slug = "mystery-revealed"
draft = false
+++

![](images/img-001.png)

*[As promised, here's the reveal writeup from* [*last week's mystery post*](/igotw/2017-08-24-mystery-post/) *by* *Max Wolffe. Thanks again, Max!* *]*

[Last week Cliff posted](/igotw/2017-08-24-mystery-post/) a mysterious rainbow waterfall graph, of hosts for a service suddenly receiving no traffic, one after another.

[blocked URL](https://lh3.googleusercontent.com/Dsc6igp682ySf28iDXOmK0hl6vUgc_z8vw9wOV7G5Um13nX3_bRNihQ6jz8Q2zr2Z4OyjIgEOPrLOnoXxKyBweTF-LHEB_3g-ICPKGLUYLTaSUq1qgDyKVcVR2l3h7o6yN_hH6C1)

It almost looks like a deployment, except that the traffic drop doesn’t occur for all hosts, and there’s no informed overlay event indicating that a deployment occurred.

Upon looking at the graphs for a single host, we can see that there’s a big single spike in 5xx errors across several endpoints that realtime-dispatcher [exposes. Graph linked here.](http://ingraphs.prod.linkedin.com/dashboard/realtime-dispatcher-escalation-dashboard/?legend=false&override&auto_refresh=1&use_time_selector&start_time=1503521220000&end_time=1503550020000&consolidate=None&fabrics=prod-ltx1&width=685&height=281&hosts=ltx1-app23364.prod.linkedin.com)

[blocked URL](https://lh4.googleusercontent.com/sGuTyer6QlSEDXbjICvacAsOm2fbrYKxcUJyCwyGOnKJUjgvhAV6UHdZ7qp6GGaCnqI4GJhwOUq_l3pPoBfGhO3iMjGfAHInjLdjUeIUnX23VnnUPUnIAYv5zVzuwQOUH8uflI4N)

Errors across a number of endpoints indicate that something strange happened with a downstream, let’s look at downstream graphs to see if that’s true.

realtime-dispatcher uses Espresso as its storage layer. Here are errors for requests to Espresso from a single host, [Graph linked here](http://ingraphs.prod.linkedin.com/dashboard/realtime-dispatcher-escalation-dashboard/graph/RTD%20Error%20QPS%20Espresso%20ReadCallTracker%20ESPRESSO_MSG?legend=false&override&auto_refresh=1&use_time_selector&start_time=1503521220000&end_time=1503550020000&consolidate=None&fabrics=prod-ltx1&width=685&height=281&hosts=ltx1-app23364.prod.linkedin.com).

[blocked URL](https://lh3.googleusercontent.com/zjkAMaD6LEwBMOs251spdxUQCELaTSsILsXHBkLOIWDb4EhNg2HlGTtZ59h1QZYejleAz3k11ei6ZoSggqXaKFz1OQG3XjXSLMHY23ygrocaptN4sHeQhD7e_5o-K0hfkiARXtBE)

Espresso errors lead to publish errors

[blocked URL](https://lh5.googleusercontent.com/UmgdcV5fUOhivqJ_GehxJftWQB-ulvzOhCcVlPMpCRPmGlLe8EfynvG0HQpJbx6_DxvLUSMqBljj_2Py4lazWbWa31bvIV7QYUqG9HjW11wjSM15ZXuSJrL9_YVXyIvjSHWctrdo)

Publish errors seem to lead to a traffic drop

[blocked URL](https://lh6.googleusercontent.com/BOvN0b_pLFKlvPVMQmYmVBpvYVEJchomYD-CzgliUKRL0xKP-j92aN9se5qMjJP02Jmb5UUP0NixyLzY0m5sBi3JGjqT4E2T38Y7On5gjrZHq4eL9sqTiHtfGRdXrJF9ioedoycm)

What are the Espresso errors which spike so suddenly around that time?

com.linkedin.d2.balancer.ServiceUnavailableException: ServiceUnavailableException [_reason=Service: ESPRESSO_MSG is in a bad state (high latency/high error). Dropping request. Cluster: ESPRESSO_MSG, partitionId:0 (16 hosts), _serviceName=ESPRESSO_MSG]]

This error is thrown by D2, which has a mechanism for cutting off traffic to a service that’s experiencing high latency or error rates. It turns out that the Espresso cluster that realtime-dispatcher uses is getting into a bad state (due to GC, long queries, too much load, etc). This cause D2’s degrader mechanism to kick in and route traffic to that cluster to near zero. As the cluster degrades, realtime-dispatcher itself ends up throwing enough errors for d2 to mark it as unhealthy as well, which is why we see traffic drop to immediately after the spike in 5xx errors.

Traffic gets shed to the other nodes, which run into high error rate and shed traffic themselves, one after another, which results in the graph below. [Graph ](http://ingraphs.prod.linkedin.com/dashboard/realtime-dispatcher-qps-dashboard/?legend=false&override&use_time_selector&start_time=1503521220000&end_time=1503550020000&consolidate=None&fabrics=prod-ltx1&width=685&height=281&hosts=ltx1-app19014.prod.linkedin.com&hosts=ltx1-app19430.prod.linkedin.com&hosts=ltx1-app19599.prod.linkedin.com&hosts=ltx1-app19777.prod.linkedin.com&hosts=ltx1-app23364.prod.linkedin.com) [linked here](http://ingraphs.prod.linkedin.com/dashboard/realtime-dispatcher-qps-dashboard/?legend=false&override&use_time_selector&start_time=1503521220000&end_time=1503550020000&consolidate=None&fabrics=prod-ltx1&width=685&height=281&hosts=ltx1-app19014.prod.linkedin.com&hosts=ltx1-app19430.prod.linkedin.com&hosts=ltx1-app19599.prod.linkedin.com&hosts=ltx1-app19777.prod.linkedin.com&hosts=ltx1-app23364.prod.linkedin.com).

[blocked URL](https://lh5.googleusercontent.com/JrlUc4JInUUamTvX5XIoCF-vlZuDBiGwiRIqOgs8c4KhNxc3-aL9twe7A_KTy8zzLRVIieAMUS2TLcyei5AJ_BZZObGWS2sFc7PltyRW0gbt99vR-LrKwbyekvr8nAhaJyUlGHw5)

There are a few things that are still somewhat mysterious to me:

1. If ESPRESSO_MSG got into a bad state, why didn’t that impact all of the realtime-dispatcher hosts at the same time?

2. Why did ESPRESSO_MSG ServiceUnavailableExceptions not simply route requests to a non-degraded espresso host instead of causing realtime-dispatcher to also degrade?
