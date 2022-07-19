# [Fa](<https://en.wikipedia.org/wiki/Fa_(letter)>) programming language

> A rys-like stack based, reverse polish notation low-level programming
> language that transpiles down to assembly

# Note

Do not contribute to the python script, it will be deleted eventually,
for any ideas make an issue and also in **no way** is this currently
a production-friendly language

# Goal

Fa programming language is supposed to be similar to rys but
fixing a lot of issues it has, the initial name for fa was
rys++ but I ended up on fa, this language is going to be self-hosted
some time

# Try it online

Please don't be an ass on them, don't do stuff that
might break these compilers :)

-   Online compiler by **@usernameeReal** (<https://github.com/usernameeReal>) <http://usernamee.duckdns.org:34353/>

# Operating systems fa works on

-   GNU/Linux
-   FreeBSD

# System requirements

-   `Fasm` compiler
-   `Python3` (for now)
-   Bash-completion (optional, for completions)

# Development requirements

-   Curl

# Testing requirements

-   coreutils
    -   Tested: FreeBSD, GNU
-   BC

# Installation for developing

```bash
$ ./scripts/devsetup.sh
```

# Testing the compiler

-   Install the compiler
-   Run

```bash
$ ./scripts/test.sh
```
