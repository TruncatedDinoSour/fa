# Fa strings

Fa strings are pretty simple:

```fa
"Hello world"
```

This will push hello world onto the stack along with its length,
but there is more

Fa strings have escape sequences, for example:

```fa
"Hello world\{69}"
```

The query `\{69}` means it will convert charcode
`69` to a character which is `E`, so it'll push
"Hello worldE" on the stack along with its length

But `\{..}` queries are a bit annoying, so fa has some
aliases for them:

-   `\0` -- NULL, alias to `\{0}`
-   `\b` -- A backspace, alias to `\{8}`
-   `\t` -- A tab, alias to `\{9}`
-   `\n` -- A newline, alias to `\{10}`
-   `\f` -- A form feed, alias to `\{12}`
-   `\r` -- A carriege return, alias to `\{13}`

You can also just escape characters to return the literal,
like `\\`

There are also ANSI escape sequences, those can be used to get colour or
cursor control in the terminal, for example:

```fa
"\[1;31m]Hello world\[0m]"
```

Why don't I add the `m` by default?
Okay, so the clear sequence is `\033[H\033[J` (see `examples/clear.fa`) and
you cannot add an `m` in there, it'll just stay on the screen
so I just don't add it, also the `\[...]` syntax
is just to make it seperate from the string as I always
find it so annoying when escapes mix into strings

This would be red bold text, if you feel like it
[read more about it](https://en.wikipedia.org/wiki/ANSI_escape_code)

There are also unsigned strings, they don't push their size unlike
normal strings, they're just the string itself, you push one by prefixing
a normal string with a `u`:

```fa
u"Hello world"  -- Just the string
```

They are useful in syscalls, but remember, all unsized strings usually must
be terminated with a NUL if you're using it in a syscall:

```fa
u"Hello world\0"
```

Or it might make you push the length of the string (like `write`)
