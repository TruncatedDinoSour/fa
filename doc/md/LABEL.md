# Label keyword in fa

`Label` keyword will define a label, that is a rejumpanle
piece of code

`Label` takes one inline argument, that is the name
of the label

Example of the `label` keyword:

```fa
include 'std/std.fa'

label a
    %EXIT_SUCCESS %exit

goto a
```
