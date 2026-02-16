+++
title = "On Inertia"
date = "2021-05-14"
slug = "on-inertia"
draft = false
+++

I recently came across [a post about “low-priority alerts”](https://utsavshah.com/2020/10/12/case-against-low-priority-alerts/) that resonated pretty strongly with me. Coincidentally, I read it shortly after (re-)joining a team and getting (re-)added to all of that team’s email distros, which led to an influx of email “alerts” that I didn’t have existing filters for. ...and when I say “influx” I’m talking about hundreds of emails a day.

Here’s the thing: that sudden flood of emails [was not a surprise to me](/igotw/2017-05-04-not-even-wrong/). I’m as capable as setting up email filters as anyone else who has an email address... but...well...

Let’s talk about how alerts come to be.

Alerts have many birthplaces. Maybe a new service is spun up and a part of the deployment checklist is putting alerts in place. Or maybe there’s some service that automates alert generation based on some external source of truth about what the thresholds for alerting should be.

The alert origin I’d like to focus on here is “incident-driven alerting”.

It starts off with an incident happening. Maybe that incident was some super-subtle thing that went unnoticed for 7 months. Or maybe some fluctuation in some metric somewhere was noticed after 7 hours. Or 7 minutes.

It could’ve been 7 seconds, it doesn’t matter. Someone is going to ask “Did we have signal (that this was broken)?” and/or “Could we have detected this faster?”

These are awesome questions to ask, and awesome questions to ask ***consistently*** in the name of continuous improvement. This is why _DS3 exists, and _ why DS3 is a huge (and largely uncelebrated) operational benefit to the business.

However.

Too frequently the Question “Could we have detected this faster?” translates into the Statement “We must detect this faster.”, which results in the Action Item of “Put a new alert in place (in the hope that we will detect this faster The Next Time).”

Human Beings have decidedly lossy communication protocols, so there is a whole confluence of reasons for why this happens - perhaps most-notably the dynamic of “A Director/VP asked a question, and that implies that I should take Immediate Action.” I don’t want to dig into that too much here.

What I do want to talk about is the following concept: ***alerts have inertia***.

Inertia, according to The Googles:

*noun:*

1. *a tendency to do nothing or to remain unchanged*

2. *a property of matter by which it continues in its existing state of rest or uniform motion in a straight line, unless that state is changed by an* *external force.*

This is pretty spot-on. Once you put an alert in place, it is never-ever going to go away unless someone removes it...and no one is ever-ever going to do that. It takes non-zero effort, and everyone is Busy as Shit.

To take the Newtonian physics analogy even further: I’ve seen alerts actually exhibit ***gravity***. Once Upon a Time I wanted to remove an alert that triggered spuriously once an hour, every hour. I was ready, willing, and able - hell, I was *keen* to delete this useless alert. The argument *against* was “Well, but if we get rid of the alert then what are we going to say when this thing breaks and someone asks why we don’t have an alert for it?”

<sigh> Christ.

...and if you’re actually getting called (and not just emailed) for this brand of alert? My heart goes out to you.

It shouldn't be this way, and I don't have an immediate solution.

But I would *strongly* suggest approaching alerts as I would approach any brand of code (alerts are code - if you disagree, let’s have a chat): take a stance of strong reluctance to put any new alert (code) in place, and one of absolute zeal for removing any alert (code) you can.
