+++
title = "Break Fix (Redux)"
date = "2018-06-28"
slug = "break-fix-redux"
draft = false
+++

A couple of weeks ago I posted a little something about an [interesting unsolved problem I happened to be working on at the time. Well, that particular ](/igotw/2018-06-15-break-fix/) problem has since been resolved (a bit on that below). ...and, in classic fashion, solving *that* problem revealed yet another problem (for which I have an inGraph, natch).

On the original issue: we were seeing intermittent timeouts between client and server when making calls through a load balancer in Azure. This turned out to be due to SSL idle timeouts. A typical SSL idle timeout on the server side is 3 hours (do a code search for "10800000" and you'll see what I'm talking about). On the client side we were using an idle timeout of 2h 55m (do a code search for DEFAULT_SSL_IDLE_TIMEOUT). If you control both ends of the pipe and you don't expect the connection to be idle for anywhere near 3 hours this is a good idea in terms of saving yourself the overhead of SSL handshakes; have the server time out after 3 hours idle, and protect yourself by having the client time out and tear down/re-establish the connection slightly before that 3-hour timeout. ...but now suppose you introduce something in "the middle of the pipe", so to speak - something with its own idle timeout that is less than (2 * 3600 + 60 * 55) * 1000 milliseconds. ...and suppose your overall client QPS happens to be low enough that any given client connection might be idle for a relatively long period of time. Welp...this collection of factors is precisely what we ran into.

As it turns out, Azure load balancers have their own idle session timeout. If the session remains idle for longer than that, the load balancer apparently drops the connection altogether. This results in a connection timeout/error the next time the client attempts to make a request using that session. Once we identified it, the fix was easy: set the load balancer idle timeout to 30 minutes and the client idle timeout to 25 minutes (similar to the 3hr/2hr55m setup we use internally). Cleared the problem right up. Great!

...and then. As things go, you'll often solve one problem only to find that it masks another. Check this out:

![](images/img-001.png)

Here's a fun inGraph of New & Different client errors. The first big spike that trails off after an hour or two? That's a node on the callee side being taken out of rotation. "Well, maybe you're not waiting for long enough after OORing the admin heath check before shutting down the container - not leaving enough time for client connections to drain off!" Yes. That is actually true. We identified that as a problem, and we have since remedied it.

...so what's the second spike? That's what happened when we brought the same node back up and put it back into rotation. "Well, maybe you're routing traffic to the newly-started container before it's fully up and ready to take traffic!" Okay. That may be true. I've tested a bit and I don't think it is. ...but here's the thing: *we see this same behavior when we take a node oor* without *taking the container down!* Simply set the admin health check to *false* - either using the oor script or manually using the JMX control - and clients start throwing errors...again, trailing off over the course of an hour or two.

I wish I'd captured a screenshot of this happening. I mean, I guess I could do that right now - it's completely reproducible, happens every time we oor a node (whether we take the container down or not). Ah, well...I'm sure it'll be happening again soon enough - specifically, any time we need to deploy anything, take a node down, introduce a new node, etc.

So. Back to the drawing board, back to engaging with MSFT support to try and figure out what's going on...
