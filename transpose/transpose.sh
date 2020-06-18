#!/usr/bin/env bash

main1(){
    readarray -t lines
    declare -i count=${#lines[@]} len=${#lines[count -1]}

    for (( i=count-2; i>=0; i-- )); do
        while [[ ${#lines[i]} -lt ${#lines[i+1]} ]]; do
            lines[i]="${lines[i]} "
        done
        [[ ${#lines[i]} -gt $len ]] && len=${#lines[i]}
    done

    for (( i=0; i<$len; ++i )); do
        transposed=""
        for line in "${lines[@]}"; do
            transposed+=${line:i:1}
        done

        echo "$transposed"
    done
}

main1 "$@"

