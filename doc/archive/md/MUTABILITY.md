# Fa mutability

Mutability in fa is deckared using these keywords:

-   `ro` -- Read only
-   `rw` -- Read/write

Some things like strings require that definition
which will change how they are stored, they go
after the data, for example:

```fa
"Hello world\n" ro
```

Will push a `read only` string on the stack
