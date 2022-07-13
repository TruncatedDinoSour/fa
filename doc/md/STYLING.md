# Suggestions on how to style your code

This is a basic rundown of how I'd suggest formatting your code
when using fa :)

-   Use a `main` function

If you don't care about the size of the output binary and can
spare at least 166 bytes I'd say go for a `main` function,
it looks nicer and generally it makes it clear where the entry
function is:

```fa
fun main
    -- code...
end

#main
```

-   Put two spaces before inline comments when comenting code inline

Okay, I know how bad the title sounds, but I mean this:

```fa
include 'std/std.fa'

fun main
    "Hello world" ro %puts  -- This is a comment
    --                    ^^ Two spaces
end

#main
```

It just makes your code more readable

-   Use snake_case for names, functions, macros and variables

Because consistency is important :)

-   Use SCREAMING_SNAKE_CASE for constants and constant macros

Refer to previous point and also marks constants and macros
like they're not gonna change

By the way, by "constant macro" I mean a macro you will never `undefine`
or change value of

-   Use 4-space indentation

The parser cannot handle tabs and also 4 spaces is what any sane person should
be using ;)

-   Don't make your code too long

Don't go over like 120 characters unless you cannot avoid it, it's extremely ugly
when it's very long

-   Includes

You should order them by the nesting, the more nested the include is the
lower is should go, for example:

```fa
include 'std/std.fa'
include 'std/mem/gmem.fa'

fun main
    %EXIT_SUCCESS %exit
end

#main
```

Includes should not go on the same line even though it's allowed and no I won't
disallow it as it does make it easier to minify the code if you want to ship it
as source but also don't want to have a huge file size

Same nesting levels should be ordered by the path length

-   Doc comments

Doc comments ("Docummentation comments") are block comments over a piece of
code which follow a syntax to tell people what your code does, is and wants,
examples can be found inn stdlib:

```fa
--<
    Print an error message and exit with EXIT_FAILURE

    Takes:
        INT: The exit code
>--
macro error
    "ERROR: " ro %STDERR %fputs
    %STDERR              %fputs
    "\n"      ro %STDERR %fputs

    %EXIT_FAILURE %exit
end


--<
    Deallocate memory

    Takes:
        INT: The buffer size
        INT: *buffer

    Returns:
        INT: ?error
>--
macro mfree
    %SYS_munmap sys 3
end
```

-   Blocks of obviously related code should be seperated by 2 line terminators

That's about it, look at the example above, related code should be seperated
by 1 line terminator and groups of related code by 2

-   Code alignment

For seperated groups of related code to make it cleaner to read you might
want to "tabulate" it, like the `error` macro in stdlib

-   Variables

Unused variables should be named `_` or `drop`ped

-   Some other recommendations
    -   Don't leave trailing whitespace
        -   Makes your code ugly to look at on editors that show
            whitespace
    -   Don't use unicode directly in your code
        -   It can break when transferring, rather use a `\{}`
            escape
    -   Avoid multiple actions in one line
        -   Like don't drop the string length, then resize the string anf
            then reverse it on the same line, it can be unreadable and if
            you cannot avoid it shove it into a properly named macro
