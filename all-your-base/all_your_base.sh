#!/usr/bin/env bash

toBase10(){
    number=$1; total=0; inBase=$2
    length=$(( ${#number[@]}-1 ))
    
    for i in "${number[@]}"; {
        total+="$(( $i*($inBase**$length) ))"
        ((length--))
    }
    echo "$total"
}

fromBase10(){
    number=$1; outbase=$2

    (( $number <= 0 )) && \
        for (( i=${#targetBase[@]}-1; i>=0; i--)); do 
            echo -n "${target[$i]} "; 
        done && exit
    targetBase+=( $(( $number % $outbase )) )
    fromBase10 $number/$outbase $outbase
}

main(){
    inBase=$1; outBase=$3; number=$2

    inBase10=$(toBase10 "$number" "$inBase")
    targetBase=()
    echo $(fromBase10 "$inBase10" "$outBase" )
}
main "$@"
