+++
title = "Mistaken Assumptions"
date = "2016-04-28"
slug = "mistaken-assumptions"
draft = false
+++

This post is about a [Major GCN that happened earlier this week. It's an unfortunate fact that site outages tend to provide super-interesting inGraphs, and ](https://jira01.corp.linkedin.com:8443/browse/GCN-20815) this week's incident was no exception. Take a look at this:

![](images/img-001.png)

This is an uptime graph. It's worth spending some time to unpack what's going on here. The dropoff around 16:15 is a canary promotion. It looks about like what one might expect - uptime drops off sequentially as the deploy rolls through each node and then starts moving up-and-to-the-right. Note the blue - that's the canary, which just keeps on chugging along since it's already at the desired version. Then - just before 18:30 -  some new nodes appear. ...and then just **after** 18:30 the original nodes drop off. (The lines are tight so it's hard to see that, but trust me...that's what happened.) None of this looks too bad thus far. Well, let's take a look at this:

![](images/img-002.png)

This is a graph of per-node QPS in the same timeframe for the same service. I included the legend with this one to demonstrate where the badness actually occurred. I'd like to draw your attention to the NaNs. The new nodes that were added **never actually took any traffic**. The hockey stick? That occurred due to nodes dropping out of rotation and the remaining nodes picking up the queries for the service, until there was only a single node taking all queries (until it eventually came down).

So what does this have to do with "Mistaken Assumptions"? Well, if this had been a mid-tier/backend service that announced to d2 then the story would be much different. The new nodes would've been automatically picked up and there would've been zero impact. As it stands, these are frontends and automatic discovery is not in place (yet - it's coming!).

[I suppose I'd sum up the lesson learned here as that old Ronald Reagan chestnut: Trust, but verify. Make sure you're newly-introduced nodes/service](https://en.wikipedia.org/wiki/Trust,_but_verify) /change/lix/etc. is working as intended. Check your inGraphs. Tail your logs. Check your EKG. Whatever you have to do.

![](images/img-003.png)

[He's climbin' in your windows, snatchin' your people up](https://www.youtube.com/watch?v=hMtZfW2z9dw)...be careful out there, folks.


