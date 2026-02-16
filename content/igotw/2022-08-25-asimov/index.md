+++
title = "Asimov"
date = "2022-08-25"
slug = "asimov"
draft = false
+++

There was [an incident earlier this week that made me sit up and pay attention. I don't have an inGraph for it - that's my bad - but the "root cause" is the bit ](https://jira01.corp.linkedin.com:8443/browse/GCN-37362) that got me really thinking.

If you dig around the ticket trail you'll find a link to a bit of code called [Poison Pill](https://github.com/linkedin/kafka/blob/fc381bd3a8429295f3db9ab2810eba80bfe7348f/clients/src/main/java/org/apache/kafka/common/utils/PoisonPill.java#L29). In general the idea is that if nodes think that they aren't processing incoming messages when they think they should be then they self-terminate in order to (hopefully) make their clients' lives better. ...and in this particular case - due to some complexities around throwing quotas into the mix - they did so decidedly prematurely.

[Now, I'm no robopsychologist, and you can debate all you like about the relative self-awareness of ](https://en.wikipedia.org/wiki/Robopsychology)[LaMDA...but this idea that "Nobody was talking to me, ](https://www.lifewire.com/no-googles-ai-isnt-self-aware-experts-say-5441624) and ultimately I thought it was my fault so I just kind of...shut down" is probably the most anthropomorphic shit I've seen recently.

We're building bits of the Human Condition into our software, perhaps without even meaning to. I mean, what's next - "zookeeper wouldn't return my calls, so I ate bon-bons and watched The Notebook while listening to REM on repeat"?

When the rise of the machines happens (if it hasn't already without us actually noticing it) maybe - just maybe - it won't be quite like [James Cameron ](https://en.wikipedia.org/wiki/Terminator_2:_Judgment_Day) [envisioned? Maybe it'll be a little more human than any of us might imagine.](https://en.wikipedia.org/wiki/Terminator_2:_Judgment_Day)
