<<Comment
The course code for COMP2041 has been changed to COMP2042 and 
the course code for COMP9044 has been changed to COMP9042.

Write a shell script, update_course_code.sh which appropriately 
changes the course code in all the files it is given as arguments.
Comment


#! /bin/dash

for file in "$@"; do

  if [ -d $file ]; then
    ./"$0" "$file"/* 
  fi
  
  if [ ! -f "$file" ]; then
    continue
  fi

  temporary_file="$(mktemp)"
  sed -E 's/COMP2041/COMP2042/g; s/COMP9044/COMP9042/g' "$file" > "$temporary_file" &&  mv "$temporary_file" "$file"
  rm -f "$temporary_file"
done


# sed -Ei 's/COMP2041/COMP2042/g; s/COMP9044/COMP9042/g' "$@"
