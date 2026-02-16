+++
title = "Postmortem Action Items"
date = "2019-02-28"
slug = "postmortem-action-items"
draft = false
+++

Fair warning: this is going to be a bit of a boring post. No pretty pictures, no fun story...just a few things I've learned over the course of some several dozen postmortems that I thought might be worth sharing. Some of what I'm about to say might seem super-obvious - particularly for those who have participated in postmortems - but I'm explicitly trying not to take too many things for granted for the sake of the uninitiated.

There are a handful of things that a successful postmortem process should hope to achieve - break-fix, incident visibility, dissemination of knowledge, pattern recognition/preventing "repeaters"...enumerating and describing each value-add is perhaps the subject of another post. The one I'd like to focus in on a bit here: the action items (AIs) that typically come out of a postmortem. Suppose you've done your postmortem and you've decided upon a set of specific AIs - Things for Folks to go off and Do in order to make the world a better place. How do you maximize the likelihood that these AIs will actually get...err...A'd?

I'll be using the term "ticket" below since that's typically the trackable form that a postmortem AI takes. In no particular order:

**Do not assign the ticket to anyone who did not attend the postmortem.** The ticket needs to be assigned to someone who is in the room. It's okay if it gets re-assigned/handed off after the fact, but don't "cold-call" someone who wasn't a part of the conversation to do the work. **Do not assign the ticket to a manager.** This one might be controversial, but in my experience manager backlog is a sort of elephant graveyard - the place where tickets go to die. Assign it to an IC who is on the hook to either Do the Needful or hand it off to someone who will. **Describe the action in actionable terms.** All too often I've seen tickets come out of postmortems with the following flavor: "Investigate the potential possibility of educating the engineering community about the future possibility of tuning their tunables." C'mon, dude. That's a ticket that either remains open for all eternity or is Closed Won't Fix. "Investigate", "Think about", "Plan for", "Conversate"...I don't have an exhaustive list of the specific verbs not to use, but...well...I'm suspicious of any ticket containing language like this. Sometimes the results of a postmortem *will* call for future conversation... but pretending that a ticket is the right vehicle to drive that conversation/thought-work is a grievous error. **Describe the action as though you had zero knowledge about the problem space.** ***Note: This applies to tickets in general.*** It is really easy to get caught up in the moment and just cut a ticket that says something like "Fix the Thing". *DO NOT DO THIS.* You may know What's Up right now...but you may not be able to take action on this ticket until a month later. Future You will thank Past You for giving Current You a heads-up about what the fuck you're supposed to be doing. You also may be handing this ticket off to someone else. Or someone with a similar issue may come along 2 years later and wonder "what did Past You know?!" Applied Craftsmanship: it is more important to write down what you did than it is to actually do it. Any number of thousands of engineers could happen upon the same particular thing that you personally had to solve That One Time...so I'll repeat again for emphasis: ***it is more important to write down what you did than it is to actually do it.***

Note that this list is not exhaustive...it's just a few of the high points that I think of when I see postmortem tickets getting doled out. (With that in mind I reserve the right to append to this list in the future...)

![](images/img-001.png)

Happy postmorteming, folks.
