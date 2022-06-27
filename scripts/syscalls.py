#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Convert linux syscall table mapping
to fa language macros"""


import sys
from typing import List, Tuple
from warnings import filterwarnings as filter_warnings


def main() -> int:
    """Entry/main function"""

    syscall_gen: List[Tuple[str, str]] = []
    biggest_sysf_len: int = 0

    for line in sys.stdin.readlines():
        if line.startswith("#") or not line.strip():
            continue

        sys_num, sys_abi, sys_name = line.split()[:3]
        sys_fullname: str = f"SYS_{sys_name}"

        if sys_abi == "x32":  # Legacy ABI
            continue

        _sys_fullname_len: int = len(sys_fullname)

        if _sys_fullname_len > biggest_sysf_len:
            biggest_sysf_len = _sys_fullname_len

        syscall_gen.append((sys_num, sys_fullname))

    for syscall_num, syscall_name in syscall_gen:
        print(
            f"macro {syscall_name} \
{' ' * (biggest_sysf_len - len(syscall_name))}{syscall_num} \
{' ' * (len(sys_num) - len(syscall_num))}end"
        )

    return 0


if __name__ == "__main__":
    assert main.__annotations__.get("return") is int, "main() should return an integer"

    filter_warnings("error", category=Warning)
    sys.exit(main())
