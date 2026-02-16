+++
title = "Right vs Best"
date = "2021-01-29"
slug = "right-vs-best"
draft = false
+++

_The topic of org charts came up in a meeting I was in a little while back. Cinco_ has some super-basic org chart data, but it doesn't really do a good job of telling you which teams/frontline managers map onto which specific product(s) within any given org. Picking on _Nicholas Han to give a specific example: _ _Cinco will tell you who reports to him, who his peers are, and who his direct manager is...but it doesn't give any indication of what teams or products his _ crew actually supports. Not to put too fine a point on it: If you're more than 1 degree removed from nihan in your day-to-day you (probably) don't have the faintest idea what that dude does.

This particular meeting happened to have a reasonably representative cross-section of Product SRE (by design), so we decided to spend 20 minutes going around the room and piecing together tribal knowledge - which parts of the org were responsible for what, who supported what/whom. We wrote it all down and put someone on the hook to pull those notes together into something coherent. When we met the following week we had an easily-consumable diagram that mapped out the org.

Awesome! This was crowd-sourcing at its best.

...so...what now? How do we keep this point-in-time snapshot up to date in a fluid environment where roles and teams change over time?

Well, LinkedIn hires loads of extremely-talented Engineers. Engineers like to build things. Using technology to solve problems, putting some New Hotness out into the world, standing back and saying "I built that!" - I reckon that's part of the appeal of the gig. And that's awesome!

So the conversation started to gravitate toward "Well, we could update the AD LDAP schema to include org metadata and then maybe build a frontend that can generate a diagram of the DAG that also includes..."

<sigh> Okay. Sure. Yes, we could do all of those things. We *could modify/*build out a bunch of infra that has to be supported in perpetuity to solve for this.

**Alternatively**, maybe we could spend 15 minutes once a month updating the static snapshot we already have.

**Or** we could make a gdocs spreadsheet that managers update when teams change.

**Or** we could hand this off to an EA - or someone with similar organizational visibility - to update when significant personnel changes happen.

In my mind this is a pretty good demonstration of [Perfect is the enemy of Good. It also has the flavor of a talk ](https://en.wikipedia.org/wiki/Perfect_is_the_enemy_of_good)[Charity Majors once gave around "Software ](https://charity.wtf/) as The Enemy" (apologies, I couldn't find a link for it), in which she made a pretty strong case that if you can achieve a business objective without writing software then in a lot of ways you've won the battle - a sort of "Software as the Option of Last Resort" sentiment that happens to resonate pretty strongly with me.

What's my point? Perhaps to encourage you to think - and think *hard* - about making this distinction between what's Right and what's Best in your day-to- day.
