#! /usr/bin/env dash

# ==============================================================================
# test00.sh
# Test the tigger-add command.
#
# Written by: Dylan Brotherston <d.brotherston@unsw.edu.au>
# Date: 2022-06-20
# For COMP2041/9044 Assignment 1
# ==============================================================================

# Create a temporary directory for the test.

test_dir="$(mktemp -d)"
cd "$test_dir" || exit 1

# Create some files to hold output.

expected_output="$(mktemp)"
recived_output="$(mktemp)"

# Create tigger repository

cat > "$expected_output" <<EOF
Initialized empty tigger repository in .tigger
EOF

tigger-init > "$recived_output" 2>&1

if ! diff "$expected_output" "$recived_output"; then
    echo "Failed test"
    exit 1
fi

# Create a simple file.

echo "line 1" > a

# add a file to the repository staging area

cat > "$expected_output" <<EOF
EOF


tigger-add a > "$recived_output" 2>&1

if ! diff "$expected_output" "$recived_output"; then
    echo "Failed test"
    exit 1
fi

# commit the file to the repository history

cat > "$expected_output" <<EOF
Committed as commit 0
EOF


tigger-commit -m 'first commit' > "$recived_output" 2>&1

if ! diff "$expected_output" "$recived_output"; then
    echo "Failed test"
    exit 1
fi

# Update the file.

echo "line 2" >> a

# update the file in the repository staging area

cat > "$expected_output" <<EOF
EOF


tigger-add a > "$recived_output" 2>&1

if ! diff "$expected_output" "$recived_output"; then
    echo "Failed test"
    exit 1
fi

# Update the file.

echo "line 3" >> a

# Check that the file that has been commited hasn't been updated

cat > "$expected_output" <<EOF
line 1
EOF

tigger-show 0:a > "$recived_output" 2>&1

if ! diff "$expected_output" "$recived_output"; then
    echo "Failed test"
    exit 1
fi

# Check that the file that is in the staging area hasn't been updated

cat > "$expected_output" <<EOF
line 1
line 2
EOF


tigger-show :a > "$recived_output" 2>&1

if ! diff "$expected_output" "$recived_output"; then
    echo "Failed test"
    exit 1
fi

# Check that invalid use of tigger-show give an error

cat > "$expected_output" <<EOF
tigger-show: error: invalid object a
EOF


tigger-show a > "$recived_output" 2>&1

if ! diff "$expected_output" "$recived_output"; then
    echo "Failed test"
    exit 1
fi

cat > "$expected_output" <<EOF
tigger-show: error: unknown commit '2'
EOF

tigger-show 2:a > "$recived_output" 2>&1

if ! diff "$expected_output" "$recived_output"; then
    echo "Failed test"
    exit 1
fi

cat > "$expected_output" <<EOF
tigger-show: error: unknown commit 'hello'
EOF

tigger-show hello:a > "$recived_output" 2>&1

if ! diff "$expected_output" "$recived_output"; then
    echo "Failed test"
    exit 1
fi

cat > "$expected_output" <<EOF
tigger-show: error: 'b' not found in commit 0
EOF

tigger-show 0:b > "$recived_output" 2>&1

if ! diff "$expected_output" "$recived_output"; then
    echo "Failed test"
    exit 1
fi

cat > "$expected_output" <<EOF
tigger-show: error: 'b' not found in index
EOF

tigger-show :b > "$recived_output" 2>&1

if ! diff "$expected_output" "$recived_output"; then
    echo "Failed test"
    exit 1
fi

cat > "$expected_output" <<EOF
usage: tigger-show <commit>:<filename>
EOF

tigger-show > "$recived_output" 2>&1

if ! diff "$expected_output" "$recived_output"; then
    echo "Failed test"
    exit 1
fi

cat > "$expected_output" <<EOF
usage: tigger-show <commit>:<filename>
EOF

tigger-show 0:a 0:a > "$recived_output" 2>&1

if ! diff "$expected_output" "$recived_output"; then
    echo "Failed test"
    exit 1
fi

echo "Passed test"
exit 0

rm "$expected_output" "$recived_output"
rm -rf "$test_dir"