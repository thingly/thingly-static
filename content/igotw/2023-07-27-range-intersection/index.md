+++
title = "Range: Intersection"
date = "2023-07-27"
slug = "range-intersection"
draft = false
+++

[The idea for this post came out of a question in #site-reliability](https://linkedin-randd.slack.com/archives/C3WAS0RB5)[; specifically: "Is there a quick way to check if two services are colocated on the same host?" ](https://linkedin-randd.slack.com/archives/C3WAS0RB5/p1690396584976839) The person who asked the question went on to say "I was thinking of getting the hosts of the two services from range and just find the intersection." There _are multiple ways to answer this question, but if you're comfortable with using range_ it might be one of the quickest/simplest.

You *could* do two range queries, maybe dump them into files or whatnot, and then sort/diff them. OR, you could leverage the fact that range natively supports the intersection operator  .**&**

As a practical example, suppose you want to answer the question "Which hosts in prod-lva1 have both mobile-tracking-frontend *and* voyager-api feed deployed on them?" You might do this:

eh -e '%%prod-lva1.mobile-tracking-frontend & %%prod-lva1.voyager-api-feed'

***What this query actually does:*** Dereferences the individual queries %%prod-lva1.mobile-tracking-frontend and %%prod-lva1.voyager- api-feed to lists of individual hosts, finds the intersection between them - that is, the hosts that those two lists have in common - and returns the resulting list.

![](images/img-001.png)

Range has some features/capabilities that perhaps not everyone is aware of; hopefully this one is helpful to you.
