#!/usr/bin/env bash

num=$1
factor=2
result=()
while [ $num -gt 1 ]; do
    if $( expr num % factor == 0 ); then
        result+=$(factor)
        num=$(( expr /= factor ))
    else
        factor+=1
    fi
done
return result
