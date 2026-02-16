+++
title = "Olympus (Draft)"
date = "2020-04-24"
slug = "olympus-draft"
draft = false
+++

*I've been working on a collaborative series of Eng Blog posts with Manny Lavery* *Armen Hamstra**,* *, and* *Tyler Grant* *on the new Messaging architecture* *(Olympus). In the absence of infinite time to write blog posts, I thought I'd "cheat" a bit and drop the (very raw) first draft of my contribution here. So...here* *it is.*

When I started at LinkedIn (September 2013) Messaging was a very different product than the one we know today. Back then I was a part of the SRE team supporting what was known as COMM, which included email infrastructure as well as "Inbox". It's telling that these things were lumped together; at the time, the product was more akin to email than to the chat experience we have today.

In those days Inbox was running in a single data center with One Big (Oracle) Database. There was a certain simplicity to this architecture that made it easy to reason about. For example, if the database went away it was easy to answer questions like "Which Members were impacted by this outage?" (Answer: ALL of them.) As LinkedIn spun up additional data centers selecting for Consistency over Availability didn't align with the goals of the business. The company had also been steadily moving toward Espresso for online data storage. All of this led to the first major change to Inbox that I had seen: the migration to Espresso and the introduction of a "multi-single-master" architecture.

I won't get into the details of the migration here other than to say it was long and fraught with peril. In terms of the resulting architecture, it was a little more complex than before but not terribly so. The idea was to split the database into N shards (starting with N=2) and distribute Members' respective inboxes roughly evenly between them. A service called Personal Data Routing (PDR) was introduced to act as the source of truth for which of the shards contained a given Member's data. Additionally, as we built out more data centers we put a replication strategy in place such that each shard would have one replica in another data center. Replication was bi-directional, and switching between replicas could be done with a single command.

This arrangement had a few nice properties. For one, if a particular data center was having issues we could fairly quickly mitigate the impact by switching to the other replica. For another, it gave us some opportunities for performance improvements by virtue of being able to move the data closer to the Member; for example, in an ideal state we could choose to route Chinese members to a data center in the APAC region in order to cut down on round-trip time. (Of course, the other side of this coin: switching between replicas had noticeable performance impact in terms of latency.)

The next major change to Inbox wasn't so much a re-architecture as it was a redesign of the product. Codenamed "Wonton", this project introduced many of the features that Messaging has today. Group conversations, threaded conversations, emojis, press-enter-to-send, and others. I look back on this time with a certain fondness as the sort of "awkward adolescent phase" of Messaging, where it was trying to be both an email-like thing and a chat-like thing (and doing neither particularly well). That said, it was a step forward in the evolution of the product and led to architectural enhancements as a natural by- product; for example, the introduction of the realtime platform in order to improve the Member experience by making the product look & feel more responsive.

Fast-forward a few years and many iterations. Somewhere along the way - probably in the Wonton days, but I can't recall for certain - we stopped calling it "Inbox" and started referring to it as "Messaging". Incremental feature additions and enhancements have made it a completely different product than it was before. ...but all of this is being built atop a 10+-year-old codebase and data architecture fundamentally designed for one-on-one email-like conversations. Making even a relatively small change to this codebase is prohibitively difficult and can have unintended side effects, and as LinkedIn's member base grows it's becoming more difficult to scale in a cost-effective way.

It's time to usher in the next major change on the Messaging journey: Olympus.
