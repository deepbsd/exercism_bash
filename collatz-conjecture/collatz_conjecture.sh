#!/usr/bin/env bash

input=${1}

error(){
  echo "Error: Only positive numbers are allowed"
  exit 1
}

# Error out if bad input...
[[ $input =~ ^[0-9]+$ ]] || error
[[ $input -gt 0 ]] || error

count=0   # count iterations...

# must remove bad input or loop is infinite
while [[ ${input} -ne 1 ]]; do
  if [ $((input % 2)) -eq 0 ]; then
    ((input=input/2))
  else 
    ((input=1+input*3))
  fi
  ((count+=1))
done

echo $count
