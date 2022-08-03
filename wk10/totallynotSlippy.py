# ADHOC programming - Inspired by slippy.
import re
import sys
# Create a python file that takes in a regex or a line number and 
# filters the STDIN based on that. /REGEX/ OR [0-9]
# If line number, quit after certain line number. 
# If regex, filter out matches.
# "13p;12d".split(";") = ["13p,"12d"]
# Get the first Argument
if len(sys.argv) != 2:
    print("Error Message",file=sys.stderr)
    exit(1)

address = sys.argv[1]

# match = re.fullmatch("s(.).*?\1.*?\1g?",address)
# print(match.groups())
# Get the first character of the argument
# 
# "s(.)(.*)\1.*\1"
# /REGEX/
# [0-9]
# $

# START WITH A NUMBER OR A FORWARD SLASH OR DOLLAR SIGN
commandType = None
if address[0] == "/":
    commandType = "REGEX"
elif address[0].isdigit():
    commandType = "NUMBER"
# If the character is a number or a forward slash we are good. (If not error)
if commandType == None:
    print("Error Message",file=sys.stderr)
    exit(1)

# If forward slash then regex. Parse the regex.

counter = 1

for line in sys.stdin:
    if commandType == "REGEX":
        
        if not re.search(address[1:-1],line):
            print(line,end="")
    elif commandType == "NUMBER":
        print(line,end="")
        if counter >= int(address):
            exit(0)
    counter+=1

# If line number, then its a line number...


# Use the regex to process stdin. 

