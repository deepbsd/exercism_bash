#!/usr/bin/env bash

letters=( 'a' 'b' 'c' 'd' 'e' \
    'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n'\
    'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w'\
    'x' 'y' 'z')

declare -A letter_map
letter_map=( [0]='a' [1]='b' [2]='c'\
    [3]='d' [4]='e' [5]='f' [6]='g'\
    [7]='h' [8]='i' [9]='j' [10]='k'\
    [11]='l' [12]='m' [13]='n' [14]='o'\
    [15]='p' [16]='q' [17]='r' [18]='s'\
    [19]='t' [20]='u' [21]='v' [22]='w'\
    [23]='x' [24]='y' [25]='z')

get_index(){
    letter=$1
    for (( index=0; index<"${#letters[@]}"; index++ )); do
        [[ "${letter}" = "${letters[$index]}" ]] && echo $index
    done
}

get_char(){
    echo "${letter_map[$1]}"
}

encode(){
    key_a=$1; key_b=$2; input=$3; output=""
    #echo "$input"
    re='[0-9]'
    for (( i=0; i<${#input}; i++ )) ; do
        char="$( echo ${input:$i:1})"
        orig_index=$(get_index "$char")
        [[ ! "$char" =~ $re ]] && \
            substitution=$((($key_a*$orig_index+$key_b)%26))\
            && output+="${letter_map[$substitution]}"\
            || output+="$char" 
        #echo "$char = $orig_index subst = $substitution sub = ${letter_map[$substitution]}"
    done
    echo "$output" | sed 's/.\{5\}/& /g' | awk '{$1=$1;print}' && exit 0
}

decode(){
    echo 'decoding'
}

main(){
    method=$1; key_a=$2; key_b=$3

    input="$( echo "$4" | tr '[:upper:]' '[:lower:]' | \
        tr -d '[:punct:]' | tr -d '[:space:]' )"
    [ "$method" == 'encode' ] && encode $key_a $key_b $input
    [ "$method" == 'decode' ] && decode $key_a $key_b $input
}
main "$@"
