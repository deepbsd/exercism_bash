#!/usr/bin/env bash

num=$1
factor=2
result=()
while [ $num -gt 1 ]; do
    echo "Num: ${num} Factor: ${factor}"  # remove later
    if [  $((num % factor)) -eq 0 ]; then
        result+=$(factor)
        (( num /= factor ))
    else
        factor+=1
    fi
done
echo ${result[@]}
