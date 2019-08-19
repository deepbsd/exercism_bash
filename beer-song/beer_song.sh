#!/usr/bin/env bash

input=("$@")    # snarf the arguments


error(){
    echo "1 or 2 arguments expected" && exit 1
}

# throw an error if we don't get no arguments
[[ ${#input[@]} -gt 0 ]] || error


say_verse(){

    bottle_num=$1
    bottle_num1=$((bottle_num-1))
    bottle_sing="bottle"
    bottle_plural="bottles"
    verse2="Take one down and pass it around,"
    verse3="Go to the store and get some more,"
 
   if [[ $bottle_num -gt 2 ]]; then
        #bottle_num1=$((bottle_num-1)) 
        bottles1=${bottle_plural}
        bottles2=${bottle_plural}
    fi

    if [[ $bottle_num -eq 2 ]]; then
        #bottle_num1=$((bottle_num-1)) 
        bottles1=${bottle_plural}
        bottles2=${bottle_sing}
    fi
 
    if [[ $bottle_num -eq 1 ]]; then
        bottle_num1="no more"
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


    verse="${bottle_num} ${bottles1} of beer on the wall, ${bottle_num} ${bottles1} of beer. 
${verse2} ${bottle_num1} ${bottles2} of beer on the wall." 


    echo ${verse} 
}

[[ ${#input[@]} -eq 1 ]] && say_verse $input && exit 0;

while [[ $input -ge 0 ]]; do
    say_verse $input
    input=$((input-1))
done

#say_verse $input

exit 0
