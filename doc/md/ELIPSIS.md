# Elipsis (...) in fa

It's just like a compile-time `nop`, it does nothing,
produces no code, just filler

```fa
include 'std/std.fa'

fun main
    ...
    %EXIT_SUCCESS %exit
end

#main
```

What is this even useful for you ask?

1. It makes it nice to write code examples
2. Making blocks empty in a more syntactically pretty way:

```fa
-- Weird
0 if end

-- Less weird
0 if ... end
```

3. Stop asking question pls thx
