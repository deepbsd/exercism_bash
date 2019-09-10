#!/usr/bin/env bash

result=""; zeros=""; ohms="ohms"
declare -A colorsToNumbers
colorsToNumbers=( [black]=0 [brown]=1 [red]=2 [orange]=3 [yellow]=4 [green]=5 [blue]=6 [violet]=7 [grey]=8 [white]=9 )

max=${colorsToNumbers[$3]}

for ((i=0;i<$max;i++)); do zeros+=0; done

for color in $1 $2
do
    [[ ! -v colorsToNumbers[$color] ]] && echo "invalid color" && exit 1
    result+=${colorsToNumbers[$color]}
done

if [ ${#zeros} -lt 2 ]; then ohms="ohms"; fi
if [ ${#zeros} -ge 2 -a $2 == 'black' ]; then ohms="kiloohms" && zeros="" && result=${result:0:1}; fi
if [ ${#zeros} -ge 2 -a $2 != 'black' ]; then ohms="kiloohms" && zeros="0" && result=${result:0:3}; fi


result+=${zeros}


echo "$result $ohms" && exit 0




