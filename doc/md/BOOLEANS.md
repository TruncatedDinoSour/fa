# Fa booleans

Fa booleans push a token of type `bul` on the stack,
they really just compile to `push <0|1>` depending if a
boolean is truthy or not

They're invoked like this:

```fa
true   -- Will push 1 onto the stack
false  -- Will push 0 onto the stack
```
