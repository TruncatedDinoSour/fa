# Fa data types

There are currently two data types in the fa
programming language:

- Integer -- Invoked by just writting any number
- String -- Invoked by writting any data in `""`

  - Read only string (put `ro` after the string`)
  - Read/write string (put `rw` after the string`)

- Buffer -- Invoked by writting a name after `#`

- Integers just push the integer on the stack
- Strings push the string and the length of it on the stack:

```
"Hello"
   |
   v
5
"Hello"
```

- Buffers push the pointer to the memory area
