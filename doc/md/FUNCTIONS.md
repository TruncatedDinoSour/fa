# Functions in fa

Functions in fa are basically managed labels
though the `rsp` register, they have a **fixed**
return stack size which can be changed though
the `-rstack-size` compiler argument, the default
is 8 kilobytes or 8096 bytes

Functions are very easy to define:

```fa
fun <function_name> [ <optional input types> ] <optional output types> eo
    <code...>
end
```

This will define a function and this infact _does_
generate executable code unlike macros, this will also
add 3 entries to the assembly's readable/writable
data section `rstack_rsp` which is where the RSP
will be stored, it's 8 bytes, static, `rstack` which
is the return stack which we already talked about and
`rstack_end` which is an empty address to indicate where
the return stack ends

Calling functions is easy, you just prepend `#` to any
function name, like:

```fa
#<function_name>
```

So a proper example:

```fa
fun exit [ int ] eo
    fun whats_sys_exit 60 end
    #whats_sys_exit sys 2 1 drop
end

69 #exit
```

This will exit with code `69`, as you can also see nested
function definitions are allowed

Functions cannot be redefined nor undefined, they are as-is
you'll have to change the name if you want to change it, so
this would throw a compilation error:

```fa
fun exit [ int ] eo
    fun whats_sys_exit 60 end
    #whats_sys_exit sys 2 1 drop
end

fun exit eo
    nop
end

69 #exit
```

And you'd get:

```
ERROR: a.fa:6:1: Function 'exit' is already defined
```

As long as dead code elimination is not implemented all
functions will stay in your code so for smaller pieces of
code I'd suggest using macros

Functions can also `ret`urn, that just means they stop execution:

```fa
fun return eo
    ret
end
```

This is a useless function which won't do anything

Now, as we got that out of the way, what are those `[ <optional input types> ] <optional output types> eo`,
they're called type signatures, or function signatures if we apply it to
only functions, it just indicates what items you take or add onto the stack, `eo`
is a terminator which stands for `End Output` which ends the output type signature,
`[` starts the intput type signature and `]` ends it, all of these are optional besides
`eo`, the compiler will just assume your function returns nothing

Example:

```fa
fun a                 eo nop end  -- Takes nothing, returns nothing
fun b [ int ]         eo nop end  -- Takes int, returns nothing
fun c [ int int ]     eo nop end  -- Takes 2 ints, returns nothing
fun d int             eo nop end  -- Takes nothing, returns int
fun e int int         eo nop end  -- Takes nothing, returns 2 ints
fun f [ int ] int     eo nop end  -- Takes int, returns int
fun g [ int int ] int eo nop end  -- Takes 2 ints, returns int
... -- And so on
```
