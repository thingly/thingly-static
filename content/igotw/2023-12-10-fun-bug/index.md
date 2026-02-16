+++
title = "Fun Bug"
date = "2023-12-10"
slug = "fun-bug"
draft = false
+++

A [recent GCN](https://jira01.corp.linkedin.com:8443/browse/GCN-39833) caught my eye - not because of its impact (although it *was* a Medium), and not because it was a repeater (although it's worth noting that it was, in fact, a [repeat...and the previous one was Major). The reason it caught my attention is the bug itself (patched ](https://jira01.corp.linkedin.com:8443/browse/GCN-39781)[here](https://github.com/percona/percona-server/commit/712cf0f778ad06f048aef940e5bd51e553e11b3a#diff-dd6fee8b73fd6ebe1276d6a59c2faecb8a57d970c64f7a3e801584a2a5a8921fL206) many moons ago, if you're interested).

The bug is in some code that configures Percona audit log rotation.

The configuration as intended: allow log files to be no more than 10^9 bytes in size, retain 10 rotations.

The configuration as interpreted by the bug: allow log files to be no more than 10 bytes in size, retain 10^9 rotations.

Hilarity ensued. Per the GCN: "The sheer check if so many files are present in the disk took more than an hour causing mysql to hang new connections."

Oof.
