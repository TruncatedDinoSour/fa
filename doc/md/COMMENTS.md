# Comments in fa

There are `two` different types of comments in
fa programming language:

- Block comments (Have a user-defined start and end)
- Line comments (Comment out a whole line, user only
  defines the beginning)

Examples of these comments:

- Block comment

```fa
include 'std.fa'  --< stdlib >--
0  --< 0 is the exit code >-- %exit
1 copy drop  --<Spaces are optional>--
```

- Line comment

```fa
-- This line will be commented out
0 %exit  -- Exit with code 0
```
