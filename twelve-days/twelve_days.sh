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
}

function say_gifts(){
    echo

}

main(){
    start=$1; end=$2
    say_prefix $start

}
main "$@"
