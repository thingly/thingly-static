+++
title = "A Modest Proposal"
date = "2019-06-06"
slug = "a-modest-proposal"
draft = false
+++

I read an article a while back about a video game studio that had taken a novel approach to protecting their product against piracy. I don't recall the studio or the specific game, but the approach stuck with me. The game was a first-person shooter, and it had a mechanism whereby it could detect whether the copy being played had been legitimately purchased. If the game suspected foul play - that is, decided that it had been pirated - its first step was to take no action. ...but then over time the guns would get more and more inaccurate until the game was ultimately unplayable.

Diabolical.

Let's stick a pin in that for now.

Fast-forward to a couple of years ago. I'm working at LinkedIn, and a gap that I see in the delivery of services is planning for service decommission. Based on experience I'd estimate that most services have (or perhaps *should* have) an effective lifespan of around 7 years, give or take. We don't plan for that [eventuality ahead of time, so decommissioning services can tend to be a long, drawn-out, painful, and expensive process (see: The Long Tail of Sadness](/igotw/2016-11-17-the-long-tail-of-sadness/)).

There are very good reasons for this. Not a whole lot of things are planned 7 years in advance - *certainly* nothing so "long-term tactical" as a (brand new!) service being decommissioned 7 years hence. There's also a very human component here. I'm trying to imagine the project kick-off meeting that starts with "Folks, we're gonna build some cool shit here...but first, let's talk about how we're gonna need to start shutting it down after 5 years or so." Frankly, that kick-off meeting sucks.

...but what if it didn't have to be like that? What might that look like?

One way of thinking about this might be "We should build things that stand the test of time, thing that are simply so good that they never expire!" Okay. As an aspirational goal that's awesome, but in practical terms it's not realistic.

The other end of the spectrum: nihilism. Why build anything at all if it's all going to descend into [entropy](http://www.technovelgy.com/ct/content.asp?Bnum=128) anyway? Okay. The heat-death of the Universe is looming...but on a human timescale you can still do some good, so maybe keep that in mind.

As a thought experiment: What if the conversation about how to decommission never had to happen? What if service obsolescence was "baked-in"? Perhaps it could work a bit like the video game example above.

Suppose after 5 years or so your service started returning errors (or simply not responding at all) to a small percentage of requests. Suppose over the course of the following 6 months it gradually increased that percentage of failed requests until ultimately reaching 100% failure rate. Suppose everything upstream and downstream of your service was built in such a way that it was resilient to these failures and degraded gracefully (this is a big "suppose", but it's *my* thought experiment so I will allow it.)

What if your service *could* go gentle into that good night, without any member impact and without any extra work on your part?
