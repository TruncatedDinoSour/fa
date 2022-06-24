# Sys keyword in fa

`Sys` keyword will call a `syscall` with arguments
on the stack

`Sys` takes at least two arguments of the stack:

- Register usage
- Syscall number

The arguments:

- Argument `Register usage` means how many registers should the syscall use (how many arguments)
- Argument `Syscall number` means the [syscall number](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)

Example of the `sys` keyword:

```fa
1 60 sys 2  -- Exists the program with code 1
            -- Will use 2 registers: rax (60) and rdi (1)
1 drop      -- Drop the result
```

This will call `SYS_exit` (60) syscall with argument `1`,
the `sys` keyword has to take two arguments off the stack,
the syscall number and the last one argument as `SYS_exit` only
takes one argument, then as every syscall returns something we
drop it off the stack
