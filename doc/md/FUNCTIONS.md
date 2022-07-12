# Functions in fa

Functions in fa are basically managed labels
though the `rsp` register, they have a **fixed**
return stack size which can be changed though
the `-rstack-size` compiler argument, the default
is 8 kilobytes or 8096 bytes

Functions are very easy to define:

```fa
fun <function_name>
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
fun exit
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
fun exit
    fun whats_sys_exit 60 end
    #whats_sys_exit sys 2 1 drop
end

fun exit
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
