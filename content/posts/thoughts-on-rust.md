+++
title = 'Thoughts on Rust - Error Handling'
date = 2025-03-10T23:27:40-04:00
keywords = ["rust", "programming", "languages", "tips", "commentary"]
draft = false
+++
_I've been spending a little time with [Rust](https://www.rust-lang.org/), and I have to admit that I've been having fun.
No, I haven't become your sterotypical Rust zealot - I'm entirely too cynical for that - but I _have_ genuinely enjoyed
discovering some of the features and (un-)pleasant surprises of the language. I've also been wanting to write down some of the
things I've learned._

_Over the course of writing this the damn thing got too long, so I'm going to try and split it up into a few different posts._

_This one will cover error handling._

## Error Handling

If you're writing anything that's destined to be much more complex than
[Hello, World](https://en.wikipedia.org/wiki/%22Hello,_World!%22_program), you're going to have to deal with error
handling. I'm going to give two pieces of seemingly-contradictory advice here:

### Don't be (too) afraid of `.unwrap()`

When you're trying to get the "bones" of your program together being able to `.unwrap()` the values
of Results and Options - perhaps to see what your IDE starts autocompleting to or to do a quick test run - is super-
valuable. This is particularly true if you're working from a well-known set of input data and want to be able to iterate quickly
on the "happy path" before worrying too much about edge cases and pathologies and fuzzing and so-forth. _However_...

### Write your own Error class sooner rather than later

Here's what you do: grab the [thiserror](https://crates.io/crates/thiserror) crate, use its derive macro to auto-generate
your own `Error` enum with some reasonable number of variants (certainly more than 1, probably fewer than 7)...and then write me a thank-you note every time you can just return a `Result<Goodies, Error>` everywhere and freely use the `?` operator without having
to worry about a pasta buffet of match statements to coerce results into your `Error` type.

`thiserror`'s derive macro and `#[from]` provide so much niceness with _very_ little investment in
boilerplate. There are other crates for doing this...but I haven't found one I like better than `thiserror`.

I've _also_ found two distinct exceptions to using `thiserror`'s auto-derived `From` implementations (there are probably more):

1) If you're dealing with UTF-8 data - which is to say, any kind of strings - you may come across the fact that there are
different "kinds" of UTF-8 errors in Rust. This is unneccessarily silly...but there's a pretty straightforward approach
to handling it and it's only a few extra lines of code:

    ```rust
    // this is the error type you get when you do String::from_utf8()
    use thiserror::Error;

    #[derive(Error, Debug, PartialEq)]
    pub enum Error {
        // this is the error type you get when you do std::str::from_utf8()
        #[error("invalid UTF-8: {0}")]
        Utf8Error(#[from] core::str::Utf8Error),
    }

    // if you're paying attention: String::from_utf8() wraps std::str::from_utf8(),
    // because the Rust motto seems to be "avoid allocations at all cost" (possibly for
    // good reason, but this kind of ergonomic nuisance irritates my pants clean off)
    impl From<std::string::FromUtf8Error> for Error {
        fn from(value: std::string::FromUtf8Error) -> Self {
            Self::Utf8Error(value.utf8_error())
        }
    }
    ```

2) The very first `thiserror` example on the very first page of their docs tells you to let it auto-derive
`#[from] io::Error`.

Don't.

Somewhere along the way, you're going to want to write a test function that has something like:

```rust
assert_eq!(my_io_function(&mut good_input), Ok("Hello, World!"));
assert_eq!(my_io_function(&mut bad_input),  Err(Error::IOError));
```

...and it's not going to work, because [std::io::Error](https://doc.rust-lang.org/std/io/struct.Error.html) doesn't implement
`PartialEq`, so it doesn't know how to compare the returned result with something that might be an error.

Why doesn't it implement `PartialEq`? Well...my Hubris Self wants to say that it's particularly well-designed and is probably an abstraction that has gotten a bit too big for its britches, but my Humility Self says I haven't the faintest idea how I'd implement a general-purpose abstraction for IO errors that encapsulated even _some_ of the major IO error cases in any kind of a portable/cross-platform way.

Anyhow, what you can do here is leverage the fact that [std::io::Error](https://doc.rust-lang.org/std/io/struct.Error.html) contains an [std::io::ErrorKind](https://doc.rust-lang.org/std/io/enum.ErrorKind.html) that _does_ implement `PartialEq`. So...the general solution I like for this:

```rust

#[derive(Error, Debug, PartialEq)]
pub enum Error {
    #[error("IO error: {0}")]
    IoError(std::io::ErrorKind),
}

// NB doing this manually because [`std::io::Error`] doesn't implement PartialEq
impl From<std::io::Error> for Error {
    fn from(value: std::io::Error) -> Self {
        Self::IoError(value.kind())
    }
}
```

If you prefer, you might also choose to cherry-pick the
[std::io::ErrorKind](https://doc.rust-lang.org/std/io/enum.ErrorKind.html)
variants (out of the **41** available) that your program is _actually_ likely to see (again, probably something like 1 < N < 7)
and implement specific match cases for those.
