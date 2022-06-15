#!/usr/bin/env python3
from sys import argv


print(f"#args = {len(argv) - 1}")
for index, arg in enumerate(argv[1:], 1):
    print(f'arg[{index}] = "{arg}"')

