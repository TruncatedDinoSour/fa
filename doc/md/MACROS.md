# Fa macros

Fa macros are pieces of code that get substituted
at compile time

You can define a macro like this:

```fa
macro <name>
    <code>
end
```

The indentation is optional but nice for
human radability

To expand a macro just type this:

```fa
%<name>
```

Example:

```fa
macro exit 60 sys 1 drop end
1 %exit
```

This program exits with a supplied code
