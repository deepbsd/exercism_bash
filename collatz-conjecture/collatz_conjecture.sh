#!/usr/bin/env bash

input=${1}

error(){
  echo "Error: Only positive numbers are allowed"
  exit 1
}

validate(){
    [[ ${1} =~ ^[0-9]+$ ]] && [[ ${1} -gt 0 ]] || error
}

validate ${input} 

posnum=${input}   # input has now been sanitized

count=0   # count iterations...

# must validate input or loop is infinite
while [[ ${posnum} -ne 1 ]]; do
  if [ $((posnum % 2)) -eq 0 ]; then
    ((posnum=posnum/2))
  else 
    ((posnum=1+posnum*3))
  fi
  ((count+=1))
done

echo $count
