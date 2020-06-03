#!/usr/bin/env bash

main(){
    readarray -t inputarr

    # get the max length of a line in input
    for ch in "${inputarr[@]}"; do
        (( ${#ch} >= max )) && max=${#ch}
    done
    # iterate over and transpose each line
    for ((i=0; i<max; i++)); do
        unset line
        for ch in "${inputarr[@]}"; do
            letter=${ch:i:1}
            line+=${letter:-+}
        done
        line=$(echo -e "${line}" | sed -e 's/+*$//')
        out+="${line//+/ }"
    done

    echo -e "$out"
    ##for line in "${outarr[@]}"; do
    ##    echo "line: $line"
    ##done
    ##echo "arr: ${outarr[@]}"
    #for ((i=0; i<"${#outarr[@]}"; i++)); do
    #    echo "${outarr[$i]}"
    #done
}

main "$@"

