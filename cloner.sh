#!/bin/sh

manifest="$1"

rm -rf git
mkdir git

while read line; do
    repo=$(echo $line | sed 's/^Fetching //' | cut -d ' ' -f 1 | sed 's/\.git//')
    gref=$(echo $line | sed 's/^Fetching //' | cut -d ' ' -f 2)
    git clone https://github.com/OpenXT/$repo git/$repo
    cd git/$repo
    git branch magic $gref
    cd -
done < $manifest
