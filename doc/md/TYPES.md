# Fa data types

There are currently two data types in the fa
programming language:

-   Integer
    -   It's invoked by: `Just writting any number, e.g. 0`
    -   It pushes ... onto the stack: `The number`
    -   It compiles down to: `mov rax, <number> and then push rax`
    -   Example: `0`
-   Pointer
    -   it's invoked by: `Using keywords like as ... and then @...`
    -   it pushes ... onto the stack: `The pointer to the value`
    -   it compiles down to: `The push of pointer to the value`
    -   example: `0 as something @something`
-   String
    -   It's invoked by: `Writting any data in ""`
    -   It pushes ... onto the stack: `The string and then length`
    -   It compiles down to: `The byte array gets created and sized in data/rodata and then both get pushed onto the stack`
    -   Example: `"Hello world"`
-   Boolean
    -   it's invoked by: `using the true/false keywords`
    -   it pushes ... onto the stack: `either 0 or 1`
    -   it compiles down to: `push <1|0> depending on the truthyness`
    -   example: `false`
-   Null
    -   it's invoked by: `using the null keyword`
    -   it pushes ... onto the stack: `0`
    -   it compiles down to: `push 0`
    -   example: `null`
-   Character
    -   It's invoked by: `Writting any data in ''`
    -   It pushes ... onto the stack: `The charcode`
    -   It compiles down to: `The byte being moved to ax and ax being pushed`
    -   Example: `'\0'`
-   Unsized string
    -   It's invoked by: `Writting any data in ""`
    -   It pushes ... onto the stack: `The string`
    -   It compiles down to: `The byte array gets created in data/rodata and then it gets pushed onto the stack`
    -   Example: `u"Hello world"`

There are also type keywords used in type checking:

-   `int` -- Integer type
-   `ptr` -- Pointer type
-   `str` -- String type
-   `bul` -- Boolean type
-   `nul` -- Null type
-   `chr` -- Character type
