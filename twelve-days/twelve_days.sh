#!/usr/bin/env bash

days=( null 'first' 'second' 'third' 'fourth' 'fifth' 'sixth'
    'seventh' 'eighth' 'ninth' 'tenth' 'eleventh' 'twelfth' )

gifts=( null 'and a Partridge in a Pear Tree' 'two Turtle Doves' 
    'three French Hens' 'four Calling Birds' 'five Golden Rings'
    'six Geese-A-Laying' 'seven Swans-A-Swimming' 'eight Maids-A-Milking'
    'nine Ladies Dancing' 'ten Lords-A-Leaping' 'eleven Pipers Piping'
'twelve Drummers Drumming' )

function say_prefix(){
    day_num=$1
    echo "On the ${days[day_num]} day of Christmas my true love gave to me: "
    say_gifts "$day_num"
}

function say_gifts(){
    verse_num=$1; verse=''
    while [[ $verse_num -ge 1 ]]; do
        [[ $verse_num -eq 1 ]] && verse+="and ${gifts[$verse_num]}" || verse+="${gifts[$verse_num]}"
        echo "$verse."
        ((verse_num--))
    done

}

main(){
    start=$1; end=$2
    for ((v=$start; v<=$end; v++)){
        say_prefix $v
    }

}
main "$@"
