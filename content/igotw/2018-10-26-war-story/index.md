+++
title = "War Story"
date = "2018-10-26"
slug = "war-story"
draft = false
+++

_Ever since I saw Kathleen Shannon's _[post on venturebeat](https://venturebeat.com/2018/10/13/what-i-learned-by-bringing-down-linkedin-com/)[ (adapted from a talk she gave](https://linkedin.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=2267d936-206c-4578-9699-8dfa0ac1a7c8) at _SREincon17_) I've been thinking about some of my own war stories. One in particular stands out in my mind. It's not a story I tell often - frankly, it's super-embarassing - but thinking back on it the experience was super-formative for me, so I'd like to talk about it a bit here.

Very shortly after I started at LinkedIn - perhaps 6 months in, certainly less than a year - I was working on collecting metrics from memcached using v1 of OBHC. At the time OBHC was distributed via RPM. There was some new feature I needed (I don't recall what it was), so I was going to upgrade the OBHC package on our memcached nodes. I jumped onto the salt master and issued a command that looked something like the following:

sudo salt -r %%PROD-ELA4.memcached pkg.upgrade obhc

My salt-fu is a little rusty so my syntax may be slightly off, but it should be close enough. First point of inflection in the story: "...and then I pressed Enter."

Now, I want to pause here and call out a moment that should be relatable to anyone who has spent any significant amount of time working with computers. That moment when you bang through some command that you think is innocuous/trivial, you press "Enter", and unexpected output starts dumping out on your screen. ...typically followed by a sinking feeling in the pit of your stomach and a general vague sense of dread, of "It wasn't supposed to be like this", that premonition before you even know exactly what it is that you just did wrong.

This was that moment.

I'm sitting there watching output scroll by. I'd expected a fair bit of it - I was running a command on some several hundreds of computers, after all - but... well...it just kinda *felt* like more than I would've expected. So I did what you do in this situation: mash Ctrl-C like your life depends on it, right? I knew it wouldn't "save" me - salt had already asynchronously fired off the command on a whole pile of hosts in parallel - but instinct just kind of took over at that point. Anyhow, I scrolled back through the output and started to piece together the enormity of what I'd just done. I'd just told salt to use yum to upgrade every RPM on every memcached host we had running in production. As I came to this realization, Anatoly came over and asked me if I wanted to go to lunch. Here's the second point of inflection in the story, and the one that is most cringe-worthy: I said "I could eat", locked my screen, and walked on down to the cafe with the team.

I grabbed some food, sat down, and started eating.

I recall being off in my own world at lunch, thinking about what I'd just done, and how I was now just sitting down and eating like nothing had happened.

At some point about halfway through, i brought up these pre-lunch shenanigans with Anatoly - told him the command I'd run, and the way in which I suspected it had gone awry. Anatoly gave me A Look - one that pretty clearly said "...then what the fuck are you doing with that sandwich right now?" - but he was super-cool about it. He just said "Oh. You should probably go and do something about that."

Yeah.

_By the time I got back to my desk, folks had already noticed what had happened. IIRC Casey Miller_ was in the process of notifying the NOC that he'd found evidence of a command being run that had upgraded every RPM on every memcached node in production. Folks were engaged and trying to figure out what to do about it. I'd happened to get lucky. memcached *was* distributed via RPM, but there hadn't been a newer version in the repo, so memcached itself hadn't been upgraded (or worse, restarted). There was some conversation around whether we should try to get the other RPMs back to their original state, but ultimately we decided to just let things stay as they were and exercise extreme caution the next time any memcached was restarted (for fear that a package had been upgraded that would perhaps cause it to fail to come back up).

Anyhow, this event was postmortemed. Something that I hadn't realized when I ran the command: salt was running the command `yum upgrade` under the covers, and either salt or yum itself - I don't recall which - effectively completely ignored the `obhc` parameter I'd passed in and upgraded everything on the box. I remember this postmortem pretty vividly; it was the first postmortem I'd been in at the time, I'd made the mistake that led to the postmortem in the _first place...and Bruno Connelly_ was there asking questions. Asking *me* questions. Questions like the one that brings us to our third point of inflection in the story.

Bruno: "Well, Cliff is a smart guy, I'm sure he ran this on a single node to test it out first before just blasting it out to all of production."

Me: "..."

As it turns out, this is *also* the point in the story where I need a word for that little involuntary noise you make in the back of your throat when you remember something embarrassing you did in the past.

Anyhow. All's well that ends well. I didn't bring down the site, but those who were around back then will understand what a near miss this was. I made

![](images/img-001.png)

some mistakes, but I learned immensely from them...and I'm still here. I "lived" to tell the story.
