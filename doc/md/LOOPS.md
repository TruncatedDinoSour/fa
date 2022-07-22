# Loops in fa

Loops are conditional pieces of code that loop, they're mainly
syntactical sugar for `label` keyword

## While loops

While loops are loops which loop while the condition
is true, the syntax is as follows:

```fa
while <code> do
    ...
end
```

Between while and do there must be a block of code which
pushes at the end

Example:

```fa
0 while copy 10 grt do
    "Hi" ro #puts
    1 add
end 2 drop
```

This will print `"Hi"` 10 times
