#!/usr/bin/env bash

#generateRows(){
#    declare -i num=$1 
#    declare -A rows
#    for ((i=0; i<$num; i++)); do
#        declare -a newRow
#        for ((col=0; col<=$i; col++)); do
#            [[ $col -eq $i || $col -eq 0 ]] &&  newRow+=( 1 ) ||  \
#                newRow+=( $(( ${rows[ $((i-1)) ][ $((col-1)) ]} + ${rows[ $((i-1)) ][ $((col)) ]} )) )  
#        done
#        rows+=( "${newRow[@]}" )
#        echo "newRow: ${newRow[@]}"
#    done
#    for row in "${rows[@]}"
#    do
#        echo "row: ${row}"
#    done
#}

genRows1(){
    declare -i num=$1
    declare -A rows=( [0,1]=1 )
    for ((i=0; i<=$num; i++)); do
        row=()
        for ((j=1; j<i; j++)); do
            echo "a: i-1: $((i-1)) j-1:  $((j-1))"
            echo "b: i-1: $((i-1)) j: $j"
            a1=$(( $((i-1)) ))
            a2=$(( $((j-2)) ))
            a="$a1,$a2"
            b1=$(( $((i-1)) ))
            b2=$(( $j ))
            b="$b1,$b2"
            echo "a: $a b: $b"
            rows[$i,$j]=$(( a + b ))
            row+=( ${rows[$i,$j]} )
        done
        echo "row: ${row[@]}"
    done
    echo "rows"
    for row in "${rows[@]}"; do
        echo "$row[*]"
    done

}

genRows(){
    declare -A rows=( [0,1]=1 )
    declare -i num=$1
    for ((i=1; i<=$num; i++)); do
        row=()
        for ((j=1; j<=i; j++)); do
            printf -v a "%d,%d" $((i-1)) $((j-1))
            printf -v b "%d,%d" $((i-1)) $j
            rows[$i,$j]=$(( ${rows[$a]:-0} + ${rows[$b]:-0} ))
            row+=( ${rows[$i,$j]} )
        done
        echo "${row[@]}"
    done
}


main(){
    genRows1 "$1"
}

main "$@"
