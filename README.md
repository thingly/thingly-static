# thingly.net
static site content

## Building & Running
The static content for the site is generated using [Hugo](https://gohugo.io/). On a new checkout you'll need to reinitialize theme module(s):

`git submodule update --init --recursive`

There is a Makefile with the following targets:

```
  public       build the static content
  serve        run a development server
  resume       build public-facing resume
  help         show this help
```

Note that resume comes from a separate private repo and isn't part of the regular build (which is why it's checked in alongside the rest of the static content). To refresh it you'll need to do `make resume` separately.
