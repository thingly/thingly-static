+++
title = "Spammy Loggers"
date = "2016-11-03"
slug = "spammy-loggers"
draft = false
+++

*[This week's post comes from* *Jon Sorenson* *- Manager, Security SRE - whose username (jsorenso) is properly pronounced "j-so-and-so". It doesn't* *contain any actual inGraphs, but the visualizations he came up with in Kibana were too good to pass up. Thanks for the lovely bits of art, Jon!]*

I was recently looking into making some summary dashboards in Kibana around spammy loggers. I was looking for a breakdown of log level (INFO, WARN, ERROR) per service (Login-server, UCV, etc), so I created this:

[blocked URL](https://lh5.googleusercontent.com/hq0FqhUZthO32BqSjCS-s9Bi2CxOF3FPAR53Ad7bFGftQ9pNrr02Y9gi3ATnvnEBcpJKshS_7MURzX65YILFv9efi-el3K1JZ9KPG2ncBmUjVEuoHh11v296WuiInWpOhCnyWHQv)

This showed me I had 2 dominators but left everything else hard to see given the scale.

I realized Kibana had the option to make the graph percentage based. Switching to it created a work of art:

[blocked URL](https://lh3.googleusercontent.com/4279RjdsDBcCDWK67KErPDXQVre--ieUB1prFvBq2qMnR7V5cAuHiVKT_iAE8e_zWaVTPB3TVgJ8DX_1lgXt4BwHrZXRutXexrPrBPjPlPNBufNGdN54Yr-jblUTTb3nxFopC8-N)

Now I can easily see not just the top two, but a breakdown of who’s spammy logging. Check out the full dashboard here: [https://log-viewer.prod.linkedin.](https://log-viewer.prod.linkedin.com/prod-ltx1/psec/k4/app/kibana#/dashboard/Logging-Clean-up-All-Services) [com/prod-ltx1/psec/k4/app/kibana#/dashboard/Logging-Clean-up-All-Services](https://log-viewer.prod.linkedin.com/prod-ltx1/psec/k4/app/kibana#/dashboard/Logging-Clean-up-All-Services)
