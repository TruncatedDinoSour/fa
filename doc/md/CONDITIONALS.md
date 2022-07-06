# Conditionals in fa programming language

Conditionals are pieces of code that execute
if a certain condition passes, e.g. if x is grt 0

Currently there are two keywords for that:

- `If` -- Checks if a condition is true
- `Else` -- If `if` fails run that code

Example:

```fa
0 1 grt if
    -- If 1 > 0
else
    -- Panic! The world in ending!!!!
end
```

All if/else blocks must end with an `end`
