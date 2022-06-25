# Undefine keyword in fa

`Undefine` keyword will undefine a defined macro

`Drop` takes one argument:

- Macro name

The arguments:

- Argument `macro name` defines the macro to-be-undefined name

Example of the `undefine` keyword:

```fa
macro hello 1 end
undefine hello      -- Hello won't exist anymore
```
