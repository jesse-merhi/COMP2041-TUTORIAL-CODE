#!/usr/bin/env python3

""" Write a Python function print_dict() that displays the contents of a dict in the format below:
[key] => value
[Andrew] => green
[Anne] => red
[John] => blue """

def print_dict(d):
    for key in d.keys(): 
        print(f"[{key}] => {d[key]}")

if __name__ == "__main__":
    test = {
        "Andrew":"green",
        "Anne":"red",
        "John":"blue"
    }
    print_dict(test)
