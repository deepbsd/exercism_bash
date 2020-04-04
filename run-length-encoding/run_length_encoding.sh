#!/usr/bin/env bash


decode(){
    echo "decoding"
}

count_let(){
    count=$1; chr=$2
    ((count == 1)) && count=""
    echo "$count$chr"
}

encode(){
    input=$1; output=""
    [[ -z "$input" ]] && exit 0
    count=0; chr=${input:0:1}
    for (( c=0; c<"${#input}"; c++ )); do
        if [[ ${input:c:1} == "$chr" ]] ; then
            ((count++)) 
        else
            output+="$(count_let "$count" "$chr")"
            chr=${input:c:1}
            count=1
        fi
    done

    output+="$(count_let "$count" "$chr")"

    echo "$output" && exit 0
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
