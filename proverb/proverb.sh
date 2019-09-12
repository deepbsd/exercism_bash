#!/usr/bin/env bash

# The original proverb
#for want of a nail the shoe was lost.
#for want of a shoe the horse was lost.
#for want of a horse the rider was lost.
#for want of a rider the message was lost.
#for want of a message the battle was lost.
#for want of a battle the kingdom was lost.
#and all for the want of a nail.

items=( "$@" )
verse=""

for index in $(seq 0 ${#items[@]}); 
do
    var1=${item[index]}; var2=${item[index+1]};
    if [ -v ${items[index+1]} ]; then verse+="For want of a $var1 a $var2 was lost.\n"
    else verse+="And all for want of a ${items[0]}."
    fi
    var1=""; var2="";
done

if [ "${#@}" -gt 0 ]; then printf "%s" $verse; fi



exit 0;
