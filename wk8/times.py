#!/usr/bin/env python3
""" Write a Python program, times.py which prints a table of multiplications.
Your program will be given the dimension of the table and the width of the columns to be printed. For example:

./times.py 5 5 5
    1     2     3     4     5
    2     4     6     8    10
    3     6     9    12    15
    4     8    12    16    20
    5    10    15    20    25
./times.py 10 10 3
  1   2   3   4   5   6   7   8   9  10
  2   4   6   8  10  12  14  16  18  20
  3   6   9  12  15  18  21  24  27  30
  4   8  12  16  20  24  28  32  36  40
  5  10  15  20  25  30  35  40  45  50
  6  12  18  24  30  36  42  48  54  60
  7  14  21  28  35  42  49  56  63  70
  8  16  24  32  40  48  56  64  72  80
  9  18  27  36  45  54  63  72  81  90
 10  20  30  40  50  60  70  80  90 100 """

import sys

""" 1 2 3
2 4 6
3 6 9 """

row = int(sys.argv[1])
column = int(sys.argv[2])
width = int(sys.argv[3])


for x in range(1, row + 1):
    print(f" {x:>{width}}",end="")
    for y in range(2, column+1):
        print(f" {x*y:>{width}}",end="")
    print()








