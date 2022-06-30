-   [x] Use return value in `drop`
    -   **Problem:** Didn't use
    -   **Potential solution:** Using `imul`
    -   **Solution:** Used `imul`
-   [x] Type checking
    -   **Problem:** Is complicated
    -   **Potential solution:** Well.. to type check it
    -   **Solution:** Implemented it
-   [x] Dynamic buffer allocation
    -   **Problem:** Both mmap and brk confused me
    -   **Potential solution:** Use `brk()` or `mmap()` syscalls
    -   **Solution:** Used `brk()` syscall
-   [ ] Macro scope
    -   **Problem:** No scope tracking
    -   **Potential solution:** Keep track of the current scope using strings
        and concantination so for e.g. `macro a macro b 0 end end`
        would be `[macro.a, macro.a.macro.b]`
    -   **Solution:**
-   [ ] Copying `n` ammount of elements (instead of `1`)
    -   **Problem:** Limited registers and no second stack
    -   **Potential solution:** Using math just like `drop`
    -   **Solution:**
-   [x] Better buffer management
    -   **Problem:** a) How you you free reserved bytes b) How do I manage the labels
    -   **Potential solution:** Store a tuple of the label name and
        buffer size in the token and/or `BUFFERS`
        dictionary
    -   **Solution:** None, keyword has been deprecated
-   [ ] Passing test cases
    -   **Problem:** None, just a lot of tests
    -   **Potential solution:** Make test cases
    -   **Solution:**
