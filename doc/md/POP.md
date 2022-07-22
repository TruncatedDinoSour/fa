# Pop keyword in fa

Pop keyword is just a keyword that basically does
the same as `drop`, but with a shorter keyword and less
math, it just compiles to one line of assembly:

```asm
add rsp, 8
```

Where as drop compiles down to 3:

```asm
pop rax
imul rax, 8
add rsp, rax
```

It's basically a shorter as faster version of drop, but
you don't get to control the ammount being dropped
