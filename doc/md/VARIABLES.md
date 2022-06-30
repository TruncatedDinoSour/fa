# Variables in fa

For variable management there are `3`
keywords:

-   `As` -- Maps a value pointer to a name
-   `Deref` -- Dereference a pointer
-   `Point` -- Point a pointer to a new value

You push a variable by referring to its name
prefixed with an at (`@`) sign

`As` requires one token on the stack and one
argument inline:

-   On stack: The value
-   Inline: The variable name

So an example:

```fa
11 as test
```

Would create a new variable called `test`, but
it won't be pushed yet to any stack, only initialised

`Deref` will dereference a pointer, for example
if you want to get a value from a pointer:

```fa
60 as exit_code
@exit_code deref %exit
```

If you compile this program, obviously including `std/std.fa`
you will see that the program exists with code `60`

`Point` will point a pointer to a new value, for example if we
take our previous example and do this:

```fa
60 as exit_code
@exit_code 12 point
@exit_code deref %exit
```

You will notice how that the program now exists with code `12`
and not `60` as `@exit_code` is pointing to a value `12` now
