#!/usr/bin/env bash

declare -a alphabet=( {A..Z} )

get_index(){
    char=$1
    for (( i=0; i<${#alphabet[@]}; i++ )); do
        [[ $char == ${alphabet[$i]} ]] && echo $i && break
    done
}

make_space(){
    num=$1; local output=''
    for (( n=0; n<$num; n++ )); do
        #output+='.'
        output+=' '
    done
    echo "$output"
}

create_line(){
    char=$1; spaces=$2
    this_space=$(make_space $spaces)
    echo $($this_space$char$this_space$char$this_space)
}

main(){
    char=$1; number=$(get_index $char); dots=' '; line='';

    half_length=$(((number/2)+(number/2)))  
    echo "half_length: $half_length"
    [[ $(($half_length%2)) -eq 0 ]] && ((half_length++))

    for (( i=0; i<=${number}; i++ )) {
        spaces=$(make_space $half_length)
        [[ $i -lt 1 ]] && line="${alphabet[$i]}" && echo "$spaces$line" && half_length=$((--half_length)) && continue
        line="${spaces}${alphabet[$i]}${dots}${alphabet[$i]}"
        echo "$line"
        dots+='  '
        half_length=$((--half_length))
    }
    dots=${dots%  }
    for ((i=$number-1; i>=0; i--)){
        dots=${dots%  }
        spaces+=' '
        line="${spaces}${alphabet[$i]}${dots}${alphabet[$i]}"
        [[ $i -lt 1 ]] && line="${spaces}${alphabet[$i]}" && echo "$line" && continue
        echo "$line"
    }

    exit 0
}

main "$@"
