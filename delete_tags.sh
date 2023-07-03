#!/bin/bash

# Fetch all Git tags
git fetch --tags

# Get the tag value from input
tag_to_compare=$1

# Get the list of all tags
tag_list=$(git tag)

# Loop through each tag
for tag in $tag_list; do
  
# Compare the tag with v0.1.0
  if [[ $tag <= $tag_to_compare ]]; then
    echo "Retained tag: $tag"
    continue
  fi
  
# Delete the tag
  git tag -d $tag
  git push origin :refs/tags/$tag
  echo "Deleted tag: $tag"
done
