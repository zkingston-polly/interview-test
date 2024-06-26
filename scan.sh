#!/bin/bash

directory=$1
pattern=$2

find "$directory" -type f -name "*.txt" | while read -r file; do
    while IFS= read -r line || [ -n "$line" ]; do
        if [[ "$line" =~ $pattern ]]; then
            echo "File: $file, Line Number: $(grep -n -m 1 "$pattern" "$file" | cut -d : -f 1)"
            break
        fi
    done < "$file"
done
