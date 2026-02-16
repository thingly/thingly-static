+++
title = "Reminiscence"
date = "2019-04-25"
slug = "reminiscence"
draft = false
+++

When I first started at LinkedIn (waaaay back in the Fall of '13) I was a member of a team called CNC. (No, not [that one ](https://en.wikipedia.org/wiki/C%2BC_Music_Factory)_CNC.)  was Content & Community, _ _and the SRE team was led by The Venerable Tony Quan. We owned a pile of consumer-facing products - things like Homepage (the sorta-kinda rough _ equivalent of/predecessor to what we now know as Voyager), NUS/USCP (Feed), Anet (Groups), and Comm. We had a shared oncall rotation for these products, but each member of the team focused on a specific area. My focus was Comm.

Comm was a combination of a couple of things that could be roughly categorized as "email or email-like". One was the LinkedIn Inbox, which would - over the course of several years - eventually evolve into the Messaging product that we have today. The other was Notifier, which would - over the course of several years - get replaced with Stork and the Flock suite of services that handle email, push notifications, and SMS.

At that same time there was another SRE team called Core. Core SRE was responsible for Profile (Identity), Growth, Traffic...I know they owned those, at least. I think they probably owned some other services, too, but I honestly don't recall. There has to be some kind of reason for why things were organized in this way, but man...Growth *and* Traffic? Poor bastards.

ISB wasn't a Thing - perhaps not even a gleam in someone's eye. Profile was backed by Oracle and had a cache in front of it - partially for performance reasons, but IIRC it was primarily to alleviate database pressure. ...and back in Those Days, caches were memcaches and couchbases were Davenports, y'dig? You just lost 1 of N memcache nodes? Well, then you just lost 1/Nth of your cache, buddy...hope your database can handle the additional load. Man...I know it wasn't that long ago, but it almost makes me blush how fragile things were Back Then.

Anyhow, I'm pretty sure Core hated me in those days. Let's explore why!

Let's talk caches.

One of the basic principles that make caches effective - at least, the kind of caches we're talking about here - is the principle of temporal [locality of ](https://en.wikipedia.org/wiki/Locality_of_reference) [reference. Once a particular piece of data has been accessed there is a relatively high probability that the same piece of data will be accessed again in the ](https://en.wikipedia.org/wiki/Locality_of_reference) near future. For example, imagine 1,000 people (or 10,000...or 100,000...or a million...) are accessing the same member's profile around the same time. If that's a typical access pattern then maybe it makes sense to stuff some/all of that member's profile data into a small, super-efficient cache of the most frequently-accessed data. The client requesting the data can check the cache first, and if the data isn't there then it can fail back to the database (and put that data into the cache for the next guy that comes along).

So now we have an efficient (but limited-retention) mechanism for both improving performance and alleviating database load. Coolcoolcool.

There are a few details I'm glossing over here - questions like "Why not just make the cache bigger?", or even "Why not just make the database moar fasterer in the first place?" Those are good questions - hit me up, I'd be happy to chat about them some time - but the short answer: Cost (both in terms of hardware footprint and engineering). In a perfect world complex data models that operate at non-trivial scale would be perfectly aligned to every potential query/use case with zero performance penalty whatsoever. In the *real* world sometimes you need to employ a little trickeration - a bit of optimization for the common case.

I'm also glossing over the question of what happens if the cache "fills up". It's a fraction of the size of the database it sits in front of, right? So what if more data comes in than it can hold? The tl;dr is "it depends". I've covered one (pathological) scenario here [before, but a more graceful scenario is that the ](/igotw/2016-07-14-cache-replacement/) cache starts evicting data - starts [replacing "older" data with "newer" data](https://en.wikipedia.org/wiki/Cache_replacement_policies#Least_recently_used_(LRU)).

Bringing it back around: Why did Core "hate" me? Well, I owned the email infra, right? Suppose some new email campaign comes along. Suppose it targets 100 million members. Suppose each email needs to be decorated with some specific bit of that member's profile data. ...and suppose we blast these out all at once, as fast as we can?

Hilarity ensues, that's what.

Man oh man...I'm not confident that I could actually design and engineer a better profile cache-buster. I just wish I had an inGraph of the cache hit rate from Way Back When. I scoured my collection...sadly, I do not have an inGraph saved off for this one.

There's some additional hilarity in how we tried to solve for this, but I'll save those memories for another post. I'm already in the textual territory of a YouTube video that's longer than 90 seconds, so I'll just leave you with this: you kids don't know how good you have it these days! ;-)
