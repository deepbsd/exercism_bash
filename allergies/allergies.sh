#!/usr/bin/env bash

score=$1
method=$2
allergies=$3

allergens=('eggs' 'peanuts' 'shellfish' 'strawberries' 'tomatoes' 'chocolate' 'pollen' 'cats')

length=${#allergens[@]}

function genlist(){
    for (( i=0; i<$length; i++))
    do

        #echo allergens[$((echo ${score}<<$i))]

        echo ${allergens[$i]}
    done

}
  


list=$(genlist $score)

genlist

echo $list

