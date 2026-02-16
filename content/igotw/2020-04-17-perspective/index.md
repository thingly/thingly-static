+++
title = "Perspective"
date = "2020-04-17"
slug = "perspective"
draft = false
+++

In a previous life I worked for a small non-profit tech company that provided services to libraries around the world. I loved the vision & mission of the company, but from a technology standpoint the company was (and likely still is) decidedly less-mature than LinkedIn.

A few examples:

**Deployments**

1. Notify all customers that there would be a “maintenance window” on Sunday from 02:00 - 06:00 Eastern time.

2. On Sunday at 02:30, *shut down the entire site*.

3. A buncha folks furiously scp tarballs and change symlinks by hand.

4. Turn it all back on, commence finger-crossing.

5. A buncha folks poke around at various parts of the site. Mebbe some subset of them tail a few log files.

6. Assuming everything looks like it’s more-or-less working, the maintenance window is lifted and everyone goes home and tries to get a few hours’ sleep. (Yes, this was all done *in situ*.)

**Mainframe**

Yep, we had one. Not only was it expensive to operate, but it also entailed significant operational risk in that there were exactly two people at the company who knew anything about how it worked. Perhaps worth noting: those two people weren’t exactly “spring chickens.” (I say this with fondness, as one of those two people happened to be my mother...who is now retired.)

Over the years it had been downsized a few times, but we couldn’t seem to get rid of it entirely. Why? Well, one time I mentioned that there was a three- year plan to decommission the mainframe to an engineer I worked with. Her eyes got wide - “But...what about the *Boss Files*?” (I am not making this up. We had a thing called Boss Files, and the way she said it led me to believe that they needs must be capitalized.) I asked her what Boss Files were, what business purpose they served. She didn’t know. ...but this engineer, who I respected, believed in her heart-of-hearts that Boss Files were in some way critical to the business.

After that conversation I asked around. *I never found anyone who could describe to me what Boss Files were* for. The company was still operating a mainframe when I left in 2013. (I asked mom - they finally got rid of it a couple of years after she retired...in 2018.)

**Germany**

One time I was assigned to a project that would help us expand the business in the German market. We had a service that we wanted to sell in that market, and the only way that a German library would buy it is if it ran in a German data center operated by either the library itself or one of the German library consortia that the library did business with. The purpose of the project was to figure out how we might package and deliver the product such that it could be run in someone else’s data center. It was a pretty significant undertaking with a lot of things to figure out - how data access would work, how to secure it, how to make it “turnkey”, how to deliver software updates, what the support model would look like when it broke, etc.

I don’t remember all of the details of the project, but I recall one of the early planning meetings pretty vividly. One of my network engineers made the statement “If Die Deutsche Bibliothek doesn’t have F5 load balancers configured exactly like ours are then our product won’t be able to work.” At first I thought he was unimaginative, or perhaps simply lacked faith in the German people; I mean, surely Ze Germans are capable of configuring network hardware, yes?

It was only later that I realized the terrible truth of what he was trying to say: over time *we had pushed sufficient complexity into the load balancing* *configuration that it was effectively indistinguishable from business logic*.

**Epilogue**

Why trot out these little vignettes, [years after the fact](https://www.youtube.com/watch?v=N2uA7DbWook)? Well, sometimes I think back on those days as a way to gain a little perspective. For example: in a place not so far off, in a time not so long ago, I didn’t have the advantage of a CI/CD pipeline. And yeah, sometimes that shit breaks - something is broken somewhere at all times, that’s kinda the nature of the beast. ...but I’m here to tell you that the alternative - not having automated mechanisms for reliably delivering software - is so much worse.

The other side of the “You don’t know how good you have it” coin: in spite of all technological advancement, we all live in the same [glass house. I suspect ](https://en.wikipedia.org/wiki/Those_who_live_in_glass_houses_should_not_throw_stones) more than one person reading this has their own “Boss Files”. Things can always be improved. Don’t get complacent.
