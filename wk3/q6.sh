#!/bin/sh
# Removes all HTML files in the current directory which use <blink>

for file in *.html
do
    # note use of -i to ignore case and -w to ignore white space
    # however tags containing newlines won't be detected
    if grep -Eiw '</?blink>' "$file" >/dev/null
    then
        echo  "Renaming $file  because it uses the <blink> tag"
        mv "$file" "$file.bad"
    fi
done
