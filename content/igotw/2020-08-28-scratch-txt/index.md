+++
title = "scratch.txt"
date = "2020-08-28"
slug = "scratch-txt"
draft = false
+++

I have a file called scratch.txt that I've used as a running scratchpad since I started at LinkedIn. It contains little snippets of logs/stack traces, partially- drafted emails, bits of yaml, shell commands (*so much grep!*), etc. It's around 5800 lines, and every now and again I'll spend a few minutes scrolling around it in a sort of trip down memory lane/archaeology project. For instance:

control-deployment -f ela4 rollback-product --product nux --tag nux.production --version 0.2.36 --host- concurrency 100%

Hoo, boy, a rollback at 100% concurrency? That must've been a GCN. Also, who remembers control-deployment? ...ela4? ...nux?

Along similar lines:

modtopo add-canary-hints -a inbox-tomcat -c 1 canary

Who remembers using modtopo to add canary hints to topology? ...or the time 200 engineers sat around at two in the morning waiting on The Lock?

There are also some pretty cringeworthy things in there, bits that feel a little like Past Me is perhaps trolling Present Me:

mssh --maxflight 25 -r '%{ela4,prod-lva1,prod-ltx1}.growth-logstash.1' "ps -wwef | grep growth-logstash | grep -v grep | awk '{print $2}' | xargs sudo -u app kill -9"

Oh my. I've been around long enough to know that sometimes ya gotta do what ya gotta do, but...lordy, I hope I never actually *ran* this command.

Interspersed among all this techno-detritus there are little glimpses of humanity - song lyrics, a humorous excerpt from an IRC conversation, a bit of poetry. So I'll leave you with this fun little bit of haiku, date and origin unknown:

opinions about range are like assholes: ev'ry person has got one

![](images/img-001.png)

Wonderful. Happy Friday, folks.
