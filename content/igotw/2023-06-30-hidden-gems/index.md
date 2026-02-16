+++
title = "Hidden Gems"
date = "2023-06-30"
slug = "hidden-gems"
draft = false
+++

I've known about **python -mjson.tool**[ for a while now, but this post about CLI tools hidden in the Python standard library opened my eyes to other lil ](https://til.simonwillison.net/python/stdlib-cli-tools) squirreled-away goodies. After a bit of grepping and awking similar to what's in the TFA, I had a list of candidates to try out.

First of all, I gotta know what **turtle.py** is, right?

python3 -mturtle --help Traceback (most recent call last): File "/usr/lib/python3.10/runpy.py", line 196, in _run_module_as_main return _run_code(code, main_globals, None, File "/usr/lib/python3.10/runpy.py", line 86, in _run_code exec(code, run_globals) File "/usr/lib/python3.10/turtle.py", line 107, in <module> import tkinter as TK ModuleNotFoundError: No module named 'tkinter'

<sigh> Not exactly an auspicious start. Ah, well - plenty of others to play with. How 'bout **tabnanny.py**?

python3 -mtabnanny Usage: /usr/lib/python3.10/tabnanny.py [-v] file_or_directory ...

Huh. Not a lot to go on here, and no --help option.

...dare I?

I daren't. Let's try another tack:

head /usr/lib/python3.10/tabnanny.py #! /usr/bin/env python3

"""The Tab Nanny despises ambiguous indentation.  She knows no mercy.

tabnanny -- Detection of ambiguous indentation

For the time being this module is intended to be called as a script. However it is possible to import it into an IDE and use the function check() described below.

So be it (I'm still not running it). Moving on, **sre_constants.py** sounds cool - let's take a look at that!

head /usr/lib/python3.10/sre_constants.py # # Secret Labs' Regular Expression Engine # # various symbols used by the regular expression engine. # run this script to update the _sre include files! # # Copyright (c) 1998-2001 by Secret Labs AB.  All rights reserved. # # See the sre.py file for information on usage and redistribution. #

Oh. Not *that kind* of SRE. Damn shame...I thought there would be _something about beards_ in there.

Alright, last-ditch effort here...

python3 -mencodings.rot_13 abcdefg nopqrst

Okay, good, at least **encodings/rot_31.py** does the expected thing. Coolness!
