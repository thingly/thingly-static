+++
title = "Shims"
date = "2022-01-28"
slug = "shims"
draft = false
+++

A buddy of mine recently took a position with a new employer. Most of his meetings at his former gig had a primarily non-technical business cast of characters - finance, accounting, et al. The new-new requires much more direct interaction with engineers, and for him that has been illuminating.

Perhaps even disillusioning.

His perception of engineers is (was?) that they work in the space of uniformity and precision: mathematics and schematics, micrometers and arithmetic, and so forth. One might imagine his consternation at being on a call with some engineers earlier this week going over a plan to raise some piece of machinery…using shims.

This little anecdote reminded me of a “war story” from a previous life when I was a sysadmin-cum-dctech. We had a smallish data center that took up half of the second floor of our office building, and in addition to Linux/Unix support my team racked-and-stacked all the gear. We didn’t have any of these fancypants overhead cable channels you see nowadays. All of the cabling ran underneath the raised tile floors, and one sunny day there was a particular tile behind a particular rack that we had to get under. Unfortunately, the rack was slightly mis-positioned such that its back feet were overlapping the tile we needed to pull up by perhaps a quarter of an inch.

A bit of digression to cover a handful of the *“Why couldn’t you just…?”* brand of questioning:

**“Why couldn’t you just go in from an adjacent tile to do what you needed to do?”**: I honestly can’t remember. It might have had something to do with the particulars of how we’d routed our fiber channel for the SAN? I just remember that the thing we had to do required that one tile to be pulled up.

**“Why couldn’t you just relocate the rack?”**: This was a fully-loaded rack of production kit running live production shit. We would’ve had to find space and power in another rack, turn off machines (probably one or two at a time), de-cable, de-rack, move, re-rack, and re-cable them…I’m not saying we *couldn’t* have done it, but it would’ve taken *Ages*.

**“Why couldn’t you just move the rack without taking the servers out? Y’know, just kinda like…nudge it over a quarter inch?”**: Well…we’ re talking about, say, $1-2M worth of (still-running!) production machines weighing something on the order of 3,000 pounds in the middle of a row of a dozen or so similar racks. I’m guessing at the numbers a bit - it’s been a long time - but I think I’m in the ballpark. This was one big heavy mamma-jamma, and one that wouldn’t take kindly to being “jostled”.

So we’re in a pickle. We called in Facilities to see if they had any ideas, and they sent up a strapping young lad to assess the situation. This feller quickly realized that he wasn’t going to be able to help unassisted - magnificent thews though he had, he was no Hercules - so he disappeared for a quarter of an hour and returned with a hydraulic jack.

The plan was simple: Duder from Facilities would place the jack Just So and lift the back of the rack up about an inch or so - just high enough that we could remove the tile, do the needful, and replace the tile - and then he would ever-so-slowly lower the rack back to the floor.

Things started off swimmingly. He lifted the rack. We removed the tile, we did the needful, we replaced the tile.

Then it came time for the “ever-so-slowly” bit. Not-Herc turned the jack’s release valve a quarter-turn counterclockwise…and the rack *immediately* dropped to the floor, cracking the tile underneath.

Time stopped.

My manager shit his pants.

His manager shit his pants.

*His* manager shit his pants, turned to me, and said “Cliff, you’d better go see if everything is still working.”

So, yeah. Shims.
