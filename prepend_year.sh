#!/usr/bin/env bash

# Usage: prepend_year.sh <directory>
# Outputs CSV with year prepended to each line from yobYYYY.txt files

dir="${1:-names}"

for file in "$dir"/yob*.txt; do
    year="${file##*/yob}"
    year="${year%.txt}"
    while IFS= read -r line; do
        echo "$year,$line"
    done < "$file"
done
