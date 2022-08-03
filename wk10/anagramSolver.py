from english_words import english_words_set
from pprint import pprint
from itertools import permutations 

import sys

# Find words based on anagrams given to the stdin. Using the above libraries
# FROM -> MORF -> FORM



word = sys.argv[1]
for perm in permutations(word):
    if "".join(perm) in english_words_set:
        print("".join(perm))