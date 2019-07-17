#!/usr/bin/env bash

input=$( echo "$@")    # snarf the arguments

echo "should be " ${#input}

error(){
    echo "1 or 2 arguments expected" && exit 1
}

# throw an error if we don't get no arguments
[ ${#input} -gt 1 ]  || error

echo "${input}"

bottle_num=$(echo "${input[0]}")

verse="${bottle_num} bottles of beer on the wall, ${bottle_num} bottles of beer.  Take one down and pass it around, $(${bottle_num}-1) bottles of beer on the wall."


echo ${verse}  && exit 0
