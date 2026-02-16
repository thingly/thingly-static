+++
title = "Hyrum's Law"
date = "2020-06-19"
slug = "hyrum-s-law"
draft = false
+++

This week _Ben Weir_[floored me with a reference to Hyrum's Law. As a concept it felt familiar - perhaps in the category of something I "felt" but hadn't ](https://www.hyrumslaw.com/) thought too much about - but...man...

*With a sufficient number of users of an API, it does not matter what you promise in the contract: all observable behaviors of your system will be* *depended on by somebody.*

This is some deep observational shit, folks. The bit about "bug-for-bug compatibility" gave me chills - this idea that once you've achieved critical mass in the Real World it doesn't matter what you *said* you would do. What matters is what you *actually do*, with implications about what you might have to carry forward *in perpetuity*. Clever [xkcd](https://xkcd.com/1172/) aside this phenomenon can be seen in so many places. Let's talk about a few of them.

First up: Poke around [LKML](https://lkml.org/) a bit and you'll find numerous examples of Linus Torvalds lambasting someone-or-other for a kernel commit that broke userspace. I'm not sure Torvalds' approach would be my own - Duder has a knack for and a history of laying down nerd-vitriol - but I can appreciate holding the line on kernel changes not causing backward-incompatible userspace issues. I like that you don't get to break things and then say "Well, they've been 'doing it wrong' all along, so they should change!"

Next: I talked to a buddy of mine about this earlier this week and it led to a discussion about the legal liability of chairs (because we're some exciting dudes that lead exciting lives). Chairs are perhaps unarguably meant for sitting on. ...but who among you has stood on a chair? What if the chair breaks while you're replacing that out-of-reach light bulb? Who is ultimately responsible? As a chairmaker, you need to understand that while asses are a part of the explicit contract, feet are a part of the implicit contract.

And perhaps the penultimate example: duct tape. I'd wager that HVAC work is the minority use case for the thing duct tape is nominally meant for. Imagine the hue and cry if duct tape manufacturers somehow reformulated duct tape so that it only [worked on ducts. (Hilarious side note about a study done on ](https://en.wikipedia.org/wiki/Duct_tape#Usage_on_ductwork) [sealants and tapes](https://en.wikipedia.org/wiki/Duct_tape#Usage_on_ductwork): “Their major conclusion was that one should not use duct tape to seal ducts.” I love that.)
