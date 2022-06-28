#! /bin/dash

mlalias cs2041.22T2.tut04 |
sed -n '/Addresses/,/Owners/p' |
head -n -1 |
tail -n +2 |
sed -E 's/^\s*//; s/\s*$//' |
cut -d@ -f1 |
grep '.' |
while read zid; do
    acc "$zid" |
    sed -n '/^$/,/^$/p' |
    cut -d: -f2 |
    tr ',' '\n' |
    sed -nE 's/.*([A-Z]{4}[0-9]{4})t[0-3]_Student.*/\1/p'
done |
sort |
uniq -c |
sort -rn | sed -E "s/^\s*//" | head -3
