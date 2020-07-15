#!/usr/bin/env bash

# Including the last test, this takes about 10.5 min on an i7-4700MQ laptop with 24G of memory
# and running Linux Mint 20.  Runs about 6m20s on my i5-6700K with 32G of memory.

main(){
    for (( a=0; a<=$1/3; a++ )); do
        for (( b=a+1; b<$1/2; b++ )); do
            c=$(($1-a-b))
            if (( $a**2 + $b**2 == $c**2 )); then
                triplets+=( "$a,$b,$c" )
            fi
        done
    done
    for triplet in "${triplets[@]}"; do echo $triplet; done | sort -n
}

main "$@"
