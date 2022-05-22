# SlowDB

This is a lightweight slow database, useful for many of the same use cases as
blockchains, but it's more flexible.

In its default configuration, it neatly sidesteps many of [the distributed
systems
problems](https://www.the-paper-trail.org/post/2014-08-09-distributed-systems-theory-for-the-distributed-systems-engineer/)
that make blockchain systems difficult to develop.

It implements most of the SQL-92 standard and can be extended in
[numerous](https://tailscale.com/blog/database-for-2022/)
[ways](https://blog.cloudflare.com/introducing-d1/).

It's useful to compare the out-of-the-box defaults against other
"industry-standard" databases like SQLite:

<img width="1007" alt="Comparison clearing showing slower performance with SlowDB" src="https://user-images.githubusercontent.com/15069/169697189-258eda5d-c437-4bf1-9a10-1a72c54a0a8b.png" />

As you can see, performance with SlowDB is slow enough to satisfy most needs.

But if your platform needs even slower performance, you can set the environment
variable `SLOWNESS_FACTOR` to a higher value to get even slower (the default
slowness factor is 10).


## Benchmarks

You can check out performance for yourself with:

```
../sqlite/slowdb-bench/bench.sh DB_EXECUTABLE_PATH
```



## Compiling for Unix-like systems

First create a directory in which to place
the build products.  It is recommended, but not required, that the
build directory be separate from the source directory.  Cd into the
build directory and then from the build directory run the configure
script found at the root of the source tree.  Then run "make".

For example:

        tar xzf sqlite.tar.gz    ;#  Unpack the source tree into "sqlite"
        mkdir bld                ;#  Build will occur in a sibling directory
        cd bld                   ;#  Change to the build directory
        ../sqlite/configure      ;#  Run the configure script
        make                     ;#  Run the makefile.

The configure script uses autoconf 2.61 and libtool.  If the configure
script does not work out for you, there is a generic makefile named
"Makefile.linux-gcc" in the top directory of the source tree that you
can copy and edit to suit your needs.  Comments on the generic makefile
show what changes are needed.
