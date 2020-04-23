#!/usr/bin/env bash

declare -a alphabet=( {A..Z} )

error(){ echo 'invalid input' && exit 1; }

get_index(){
    char=$1
    for (( i=0; i<${#alphabet[@]}; i++ )); do
        [[ $char == ${alphabet[$i]} ]] && echo $i && break
    done
}

make_space(){
    num=$1; local output=''
    for (( n=0; n<$num; n++ )); do
        output+=' '
    done
    echo "$output"
}

main(){
    [[ ! $1 =~ ^[A-Z]$ ]] && error
    char=$1; number=$(get_index $char); inner=' '; line=''; half_length=$number

    for (( i=0; i<=${number}; i++ )) {
        spaces=$(make_space $half_length)
        [[ $i -lt 1 ]] && line="${alphabet[$i]}" && echo "$spaces$line$spaces" && half_length=$((--half_length)) && continue
        line="${spaces}${alphabet[$i]}${inner}${alphabet[$i]}${spaces}"
        echo "$line"
        inner+='  '
        half_length=$((--half_length))
    }
    inner=${inner%  }
    for ((i=$number-1; i>=0; i--)){
        inner=${inner%  }
        spaces+=' '
        line="${spaces}${alphabet[$i]}${inner}${alphabet[$i]}${spaces}"
        [[ $i -lt 1 ]] && line="${spaces}${alphabet[$i]}${spaces}" && echo "$line" && continue
        echo "$line"
    }
    exit 0
}
main "$@"
