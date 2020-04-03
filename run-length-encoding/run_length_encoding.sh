#!/usr/bin/env bash

declare -A data

decode(){
    echo "decoding"
}

encode(){
    input=$1; output=""
    [[ -z "$input" ]] && exit 0
    for (( c=0; c<"${#input}"; c++ )); do
        chr=$(echo "${input:$c:1}")
        [[ ${!data[@]} =~ $chr ]] && data[$chr]=$((${data[$chr]}+1))\
        || data[$chr]=1
    done

    for k in "${!data[@]}"; do
        output="${data[$k]}$k$output"
    done

    echo "$output" | sed 's/1//g' && exit 0
}

main(){
    method=$1
    input=$2
    [[ "$method" == 'encode' ]] && encode "$input"
    [[ "$method" == 'decode' ]] && decode "$input"
}

main "$@"
#main 'AAABBBBCCCCC'
#main ''
#main 'XYZ'
