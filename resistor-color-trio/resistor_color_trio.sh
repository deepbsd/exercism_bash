#!/usr/bin/env bash

result=""; zeros=""; ohms="ohms"
declare -A colorsToNumbers
colorsToNumbers=( [black]=0 [brown]=1 [red]=2 [orange]=3 [yellow]=4 [green]=5 [blue]=6 [violet]=7 [grey]=8 [white]=9 )

error(){ echo "invalid color" && exit 1; }

[[ ! -v colorsToNumbers[$3] ]] && error      # error out if invalid 3rd arg 

max=${colorsToNumbers[$3]}  # how many zeros? 
for ((i=0;i<$max;i++)); do zeros+=0; done  

for color in $1 $2     # get the first pair of numbers
do
    [[ ! -v colorsToNumbers[$color] ]] && error
    result+=${colorsToNumbers[$color]}
done

result+=${zeros}    # add all the zeroes to get a proper count

num=$(awk -F "0" '{print NF-1}' <<< "${result}")  # going to remove all unneccessary zeros

if [ $num -le 3 ]; then ohms="ohms"; fi
if [ $num -ge 3 -a $num -lt 6  ]; then ohms="kiloohms"; result=$(echo "$result" | sed -r 's/000//g') ; fi
if [ $num -ge 6 -a $num -lt 9 ]; then ohms="megaohms" ; result=$(echo "$result" | sed -r 's/000000//g') ; fi
if [ $num -ge 9 ]; then ohms="gigaohms" ; result=$(echo "$result" | sed -r 's/000000000//g') ; fi
if [ $result == 00 ]; then result=0; fi

echo "$result $ohms" && exit 0




