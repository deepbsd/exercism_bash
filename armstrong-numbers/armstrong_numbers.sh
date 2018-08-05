#!/usr/bin/env bash

input=${PS1}
power=${#input}

val=0

for n in ${input[@]}; do
    ((val+=n**${power}))
done

[[ ${val} -eq ${input} ]] && echo "true" && exit 0

echo "false" && exit 1
