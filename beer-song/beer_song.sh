#!/usr/bin/env bash

input=("$@")    # snarf the arguments


error(){
    echo "1 or 2 arguments expected" && exit 1
}

error1(){
    echo "Start must be greater than End" && exit 1
}

# throw an error if we don't get no arguments
[[ ${#input[@]} -gt 0 && ${#input[@]} -lt 3 ]] || error
# check that verses are in right order
if [[ ${#input[@]} -gt 1 && $1 -lt $2 ]]; then
	error1
fi

say_verse(){

    bottle_num=$1
    bottle_num1=$((bottle_num-1))
    bottle_sing="bottle"
    bottle_plural="bottles"
    verse2="Take one down and pass it around,"
    verse3="Go to the store and buy some more,"
	verse4="Take it down and pass it around,"
 
   if [[ $bottle_num -gt 2 ]]; then
        bottles1=${bottle_plural}
        bottles2=${bottle_plural}
    fi

    if [[ $bottle_num -eq 2 ]]; then
        bottles1=${bottle_plural}
        bottles2=${bottle_sing}
    fi
 
    if [[ $bottle_num -eq 1 ]]; then
        bottle_num1="no more"
		verse2=${verse4}
        bottles1=${bottle_sing}
        bottles2=${bottle_plural}
    fi

    if [[ $bottle_num -eq 0 ]]; then
        bottle_num="no more"
        bottle_num1=99
        bottles1=${bottle_plural}
        bottles2=${bottle_plural}
        verse2=${verse3}
    fi


    verse="${bottle_num} ${bottles1} of beer on the wall, ${bottle_num} ${bottles1} of beer. \n${verse2} ${bottle_num1} ${bottles2} of beer on the wall.\n"


    printf "${verse^}"
}

[[ ${#input[@]} -eq 1 ]] && say_verse $input && exit 0;

while [[ $input -ge $2 ]]; do
    say_verse $input
    echo
    input=$((input-1))
done

exit 0
