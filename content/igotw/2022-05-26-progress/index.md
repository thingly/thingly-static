+++
title = "Progress"
date = "2022-05-26"
slug = "progress"
draft = false
+++

Once upon a time I worked in a shop where our hardware provisioning "process" was for a human being (i.e., me, or someone from my team) to go down to the datacenter, roll a crash cart over to the machine to be imaged, hook it up, drop in a RedHat CD-ROM, and spend an hour or so clicking through the installer. After that, we could ssh into the machine and install packages, set up filesystems, etc. - all also manual, but at least that could be done from the comfort of one's desk rather than standing shivering in a cold row. Somewhere along the way I think we probably wrote down what each of the menu selections were and what our standard set of packages was so we didn't have to memorize (read: guess), but the real breakthrough came when we decided to build a PXE server.

For the unfamiliar, PXE stands for "Preboot eXecution Environment". Here's a super-brief primer on how it works:

1. The BIOS/firmware brings up a network interface and makes a DHCP request

2. The DHCP server is configured to return a "next server" parameter in the response

3. The BIOS/firmware connects to the "next server" via TFTP, pulls down a (super-minimal) kernel, and boots from it

4. The kernel brings up a NIC, pulls down an OS image using some more reliable mechanism than TFTP (e.g., HTTP), and installs it

Nifty! No more clicking through installer menus, and no more remembering what the base set of packages was - we could just update our "golden" install image to include those packages. We still had a bunch of manual post-build steps but at least this saved us time/manual labor at the very beginning.

...and it took *two* people to do it.

This may seem counterintuitive. Allow me to explain.

The machines we were working with had 2 NICs - for the purposes of distinguishing between them, we'll call them "left" and "right". The BIOS was hardcoded to attempt to PXE boot from the NIC on the left. The kernel, on the other hand, would attempt to bring up the first NIC that it discovered in order to pull down the OS image...which it just so happens was (deterministically, thank God) the NIC on the *right*.

So. Here was the procedure:

1. One person stands in Front of the server, one stands in Back.

2. Front powers on the server and presses F8 (or whatever key it was that told the BIOS to attempt to PXE boot).

3. Front watches for the screen to go dark, light back up, and start spewing out log lines indicating that the kernel is booting.

4. Front shouts "Switch!" or "Swap!" or "Now!" or "GOGOGO!" or "Commence!" (specific verbiage is Front's discretion).

5. Back has perhaps a 1- to 4-second window to unplug the cable from the NIC on the left and plug it into the NIC on the right before the kernel attempts to bring up the NIC.

6. (contingency plan) Front didn't yell at the right time? Back was too slow? Power down the server and return to Step 2 (optional: swap Front and Back roles).

![](images/img-001.png)

Good times.
