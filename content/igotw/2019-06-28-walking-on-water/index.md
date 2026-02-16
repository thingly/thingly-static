+++
title = "Walking On Water"
date = "2019-06-28"
slug = "walking-on-water"
draft = false
+++

I want to talk a little bit about how [a recent GCN came to be. This GCN is relatively unique in that it caused zero impact to Members. It was bumped to ](https://jira01.corp.linkedin.com:8443/browse/GCN-29845) Major due to the *potential* impact. I'll cover that a bit below, but the details of the incident itself are actually less interesting than some of the context around how it arose.

Let's dig in.

The story begins with the Voyager dev oncall trying to get a release out. The first deployment attempt showed some failures so the oncall retried. The retry also failed, so the oncall attempted a rollback. So far all of this is reasonable.

...and then the Voyager SRE oncall started getting alerts.

Stick a pin in that. There is some "flavor" I've left out above that I'd like to layer in here.

The release oncall rotation for Voyager is huge. The upshot is that the person on the hook for shepherding the release through is likely to be inexperienced - in fact, that oncall may be doing it for the First Time Ever. Voyager also strives for a "3-by-3" release cadence, which means "3 deploys a day, with the time from commit to deployment being <=3 hours". There are some very good reasons for this. Perhaps the most obvious reason is being able to iterate/release features more quickly but there are actually significant operational benefits to releasing as frequently as possible, namely that more frequent releases means a proportionally smaller change set goes out in each release. Fewer changes means reduced likelihood of breakage, and if a breaking change *does* go out it reduces the scope of investigation. If you had to choose would you rather look through 10 lines of changes to find a bug, or 1000? That said, an unfortunate side effect of trying to uphold such a cadence is that it can lead to organizational pressure to get releases out. Deployment failures that are unrelated to breakage in the code are not uncommon, and for the most part the conventional wisdom of "if at first you don't succeed..." is safe to follow.

Bringing it back around: what actually happened?

Well, the alerts that went off notified the Voyager SRE oncall that 30-40% of Voyager instances were down. It turns out that there *was* a problem with the release, one that prevented deployed instances from starting up. Deployments for Voyager are configured to go out at 15% concurrency, and the real kicker here - the crucial bit that nobody knew about until after investigation - is that LID was selecting that 15% at random. ...so each attempted deployment activity was knocking out ~15% of instances.

The good news is that this was a near miss. It happened during off-peak hours so Voyager was able to operate at reduced capacity without Member impact. It went Major (with an enforced deployment moratorium) because this particular nuance of LID host selection put all deployments at risk. Furthermore, there's a new _Convergent Deployment_ feature in LID - a nifty little piece of automation that injects retries in the event of a deployment failure. Imagine a world in which your initial deployment fails and automatic retries kick in, whacking 15% of your nodes at each go. Imagine the postmortem. "Welp...it certainly did 'converge'." Heh.

I also think this GCN is a great example of why blamelessness is a super-important cultural tenet. "Assume good intent", "attack the problem and not the person", and all of that goodness...but also, most incidents like this are characterized by a whole confluence of things coming together, to the extent that the idea of laying blame becomes almost absurd. "There shouldn't have been a bug in the release." "The deployment tooling shouldn't ever have failures." "The folks using the deployment tooling should be more well-versed in that tooling." "The instance selection should always be strictly ordered /deterministic." ...etc etc etc... This isn't to say that there shouldn't be accountability in making things better, but there are *much* more effective mechanisms to achieve that than selecting a sacrificial goat out of that herd.

When I was a kid - maybe 8 years old or so - I once decided to put Water Wings on my ankles. I thought that doing this would give me the ability to walk on water, and that was a pretty compelling visual to my 8-year-old self. The reality was my own "near miss" and probably the scariest 3 minutes of my life to that point. The analogy is an imperfect one but you may see where I'm going with this. "His parents should've been watching." "Water Wings shouldn't exist." "Swimming pools have too damn much water in them." "8-year-olds should have a better fundamental grasp of the physics of buoyancy." "Children should be designed such that they cannot drown, or at the very least the parts of them that are responsible for breathing should be placed on the bottoms of their feet." ...etc etc etc...

Anyhow. Many Words. Happy Friday, folks. :-)
