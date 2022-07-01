# Shift keyword in fa

`Shift` keyword will push an incremental integer
on the stack, useful for enums

`Drop` takes no arguments

Example of the `shift` keyword:

```fa
-- Kinda enums:

macro HELLO shift end
macro BYE   shift end

-- would be

macro HELLO 0 end
macro BYE   1 end
```
