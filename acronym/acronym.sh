#!/usr/bin/env

arglist="$@"
acronym=""


for word in ${arglist[@]}; do
  word=$(echo ${word} | tr '-' ' ')
  for char in ${word}; do
    acronym+=${char:0:1}
  done
done

echo ${acronym} | tr [:lower:] [:upper:]

