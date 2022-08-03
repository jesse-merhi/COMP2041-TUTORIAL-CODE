from pprint import pprint
# from file test.txt into a list of touples
# Data in the form "A->NUMBER" with some varying whitespace.
testFile = open("test.txt","r")
letterFreq = {}
for line in testFile:
    variable = ("".join(line.split())).split("->")
    letterFreq[variable[0]] = int(variable[1])

mostCommon = 0

for (letter,freq) in letterFreq.items():
    print(letter,"HAS FREQUENCY",freq)
    mostCommon = max(freq,mostCommon)

print("The following have the max frequencies:")

for (letter,freq) in letterFreq.items():
    if freq == mostCommon:
        print(letter)


# Return the list of all of the frequencies and then the most common letter.
# Also return if the frequency includes mostly vowels or mostly consonants.