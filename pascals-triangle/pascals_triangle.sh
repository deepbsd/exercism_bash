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

#genRows1(){
#    declare -i num=$1
#    declare -A rows
#    for ((i=0; i<=$num; i++)); do
#        rows[$i,0]=1 
#        rows[$i,$i]=1
#        for ((j=1; j<$i; j++)); do
#            a=${rows[$((i-1)),$((j-1))]}
#            b=${rows[$((i-1)),$j]}
#            rows[$i,$j]=$(( a + b ))
#        done
#    done
#
#    for ((j=0; j<=$num; j++)); do
#        echo "${rows[$num,$j]} "
#    done
#    echo
#}

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
    genRows "$1"
    #constructor(num){
    #    this.rows = this.generateRows(num);
    #    this.lastRow = this.rows[num-1];
    #}
}

main "$@"
