# Label keyword in fa

`Goto` keyword will jump to a defined label

`Goto` takes one inline argument, that is the name
of the label

Example of the `goto` keyword:

```fa
include 'std/std.fa'

label a
    %EXIT_SUCCESS %exit

goto a
```
