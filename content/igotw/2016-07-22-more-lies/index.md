+++
title = "More Lies"
date = "2016-07-22"
slug = "more-lies"
draft = false
+++

[I've posted before about how your metrics can lie to you. This post is another example. The inGraph:](/igotw/2016-02-18-lies-damned-lies-and-statistics/)

![](images/img-001.png)

The metric shown here is phone-fe latency for Wonton (Messaging). The peaks correspond to deployments. Now, you might be tempted to say "Oh my God, that's terrible! Why do deployments cause latency to go up so much?!" ...and if this inGraph were telling the truth I'd be inclined to agree with you. But let's take a look at what's really going on here.

First off: Note that the minimum value is 1.659 milliseconds. I'll go out on a limb here and make the statement that no frontend has ever given a (meaningful) response in 1.659ms. So the question we need to ask ourselves isn't "Why is the latency so high during deployments?" Rather, it's *"Why is* *the latency so* low *at steady state?"* To answer that question we'll take a look at how our metrics are emitted.

Speaking generically, metrics are emitted from sensors. Before a sensor has been initialized - e.g., before the service has taken any queries - the sensor will not emit anything. The time slices for which a sensor is not emitting any metric will get recorded as Not-a-Number (NaN). **After** the sensor has been initialized - e.g., the service has taken at least a single query - it will emit a number *even if it hasn't taken any queries in that time slice.* In this case that number happens to be zero, which is handled quite differently than NaN as we'll see in a minute.

A couple of other useful pieces of context:

1. At the time I took this snapshot phone-fe was running on 100 nodes with a dozen or so instances per node - let's call it 1000 instances for simplicity.

2. At the time I took this snapshot Messaging was still ramping, so it wasn't taking a whole lot of QPS.

3. This inGraph is showing the average latency across all instances.

4. When taking an average, inGraphs will exclude any data point with a NaN value.

The pieces should be clicking into place now, but let's make it explicit. Suppose the service has taken 60 queries in one minute (1QPS), each of which hit a distinct node and took 200ms. Suppose the 940 nodes that did **not** take queries weren't emitting any latency metric. The arithmetic for computing the average latency is straightforward and gives the expected result:

**60*200/60 = 200ms**

Now suppose the other 940 nodes have previously taken traffic and are emitting zero for their latency. Once again the arithmetic is straightforward:

**(60*200 + 940*0)/1000 = 12ms**

*...but the result is* [*Not Even Wrong*](https://en.wikipedia.org/wiki/Not_even_wrong)*.*

So the **real** reason for the spikes is that during deployment when the service is restarted the sensors get reset and once again stop emitting until initialized. In other words, those peaks are actually approaching the *real* average service latency (which IIRC leveled off in the neighborhood of 600ms at higher QPS).
