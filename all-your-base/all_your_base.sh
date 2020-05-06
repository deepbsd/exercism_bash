#!/usr/bin/env bash

toBase10(){
    number=$1; total=0; outBase=10; inBase=$2
    length=$((${#number[@]}))
    
    for i in "${number[@]}"; {
        total+="$(( $i*($inBase**$length) ))"
        ((length--))
    }
    echo "$total"
}

fromBase10(){
    number=$1; result=0; outbase=$2
    result+=( $(( $number % $outbase )) )
    
    fromBase10 $number/$obase $outbase
}

main(){
    inBase=$1; outBase=$3; number=$2

    inBase10=$(toBase10 "$number" "$inbase")
    targetBase=()
    echo $(toBase10 "$targetBase" "$inBase10")
}
main "$@"
