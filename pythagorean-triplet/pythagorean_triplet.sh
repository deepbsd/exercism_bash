#!/usr/bin/env bash


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
