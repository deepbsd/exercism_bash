#!/usr/bin/env bash

declare -a data
declare -a counts

decode(){
    echo "decoding"
}

encode(){
    input=$1; output=""
    [[ -z "$input" ]] && exit 0
    for (( c=0; c<"${#input}"; c++ )); do
        chr=$(echo "${input:$c:1}")
        prev_chr=$(echo "${input:$c-1:1}" || echo '') 
        echo "prev_chr: $prev_chr chr: $chr"
        [ -z "$prev_chr" ] && data[$c]=$(echo "$chr") && counts[$c]=1 && continue
        data[$c]=$(echo "$chr") && counts[$c]=$((counts[$c]+1))
        echo "counts: ${counts[@]}"
        echo "data: ${data[@]}"
    done

    for i in "${data[@]}"; do
        output+="$counts[$i]$data[$i]"
        echo "count: $counts[$i]  data: $data[$i]"
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
