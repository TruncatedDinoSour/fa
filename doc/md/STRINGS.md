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

- `\n` -- A newline, alias to `\{10}`
- `\t` -- A tab, alias to `\{9}`
- `\b` -- A backspace, alias to `\{8}`
- `\f` -- A form feed, alias to `\{12}`
- `\r` -- A carriege return, alias to `\{13}`

You can also just escape characters to return the literal,
like `\\`
