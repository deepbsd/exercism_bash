#!/usr/bin/env bash

makeSpace(){
    space=""; for ((i=1; i<$1; i++)){ space+=" "; } && echo "$space"
}

main(){
    declare -i num=$1; space=$(makeSpace "$num")
    declare -A row=( [0,1]=1 )
    for ((i=1; i<=$num; i++)); do
        rows=()
        for ((j=1; j<=i; j++)); do
            a1=$((i-1)); a2=$((j-1)); a="$a1,$a2"
            b1=$((i-1)); b2=$j; b="$b1,$b2"
            # if $row[$b] is undefined then it equals 0
            row[$i,$j]=$(( ${row[$a]} + ${row[$b]:-0} ))
            rows+=( ${row[$i,$j]} )
        done
        echo "${space}${rows[@]}"
        space="${space:1}"
    done
}
main "$@"
