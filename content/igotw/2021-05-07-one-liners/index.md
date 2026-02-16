+++
title = "One-Liners"
date = "2021-05-07"
slug = "one-liners"
draft = false
+++

I came across a [post about one-liners recently. It got me thinking about the commands I use the most. An incomplete list, in no particular order:](https://muhammadraza.me/2021/Oneliners/)

**emacs -nw** - Yes, I am an emacs user (who knows just enough vi to get by when emacs is unavailable.) And yes, I could alias this so that I don’t have to type the *-nw* every time. This is largely a muscle-memory holdover from a Previous Life, when sometimes I’d log into a machine that (1) had an X server running with forwarding enabled, and (2) didn’t have an alias set up. I *never* want the GUI...I *always* want it in my terminal.

**ps -wwef** - Another muscle-memory holdover, somewhere along the way this became my preferred set of ps flags. (I’m not entirely sure how I never ended up on the decidedly more-popular **ps aux** train.)

**perl -p -i -e ‘s/string/replacement/’ [filename]** - I’m not proud of it, but this is mostly because every time I try to use **sed** results in 15 minutes of me futzing around trying to figure out how on *Earth se*d's escaping works.

**rsync -avz --delete $source_dir/ $dest_machine:$dest_dir/** - The critical bit for me here is the trailing slash on both source and destination, which means “make $dest_dir look like $source_dir” as opposed to “create $source_dir in $dest_dir”. I used to accidentally do the latter All. The. Time. before just following the convention of always including the trailing slashes.

**ls -Satan -is -a -llama** - This one isn’t actually a command that has any practical utility to anyone so far as I can tell...but it’s my favorite example of a common command supporting perhaps too many flags, a delicious subversion of the Unix philosophy of “do one thing and do it well.” Satan is a llama, indeed.

**Bonus content: aliases**

I could (and might) do a whole separate post on aliases, but here are a few that I’ve come to love:

**alias emasc=emacs** - Easily my most common typo.

**alias l.=”ls -d .*"** - For when I only want to see dotfiles.

**alias igrep=”grep -i”** - Case-insensitive grep.

**alias vgrep=”grep -v”** - Inverted grep (i.e., show me everything that *doesn’t* match the pattern)

What are some of your favorite one-liners?
