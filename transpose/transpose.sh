#!/usr/bin/env bash

main1(){
    readarray -t lines
    count=${#lines[@]} 
    length=${#lines[count-1]}

    for (( i=count-2; i>=0; i-- )); do
        while [[ ${#lines[i]} -lt ${#lines[i+1]} ]]; do
            lines[i]="${lines[i]} "
        done
        [[ ${#lines[i]} -gt $length ]] && length=${#lines[i]}
    done

    for (( i=0; i<$length; ++i )); do
        transposed=""
        for line in "${lines[@]}"; do
            transposed+=${line:i:1}
        done
        echo "$transposed"
    done
}
main1 "$@"

