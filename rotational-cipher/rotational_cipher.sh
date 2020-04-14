#!/usr/bin/env bash

lower=( 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q'
    'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z')
upper=( 'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q'
    'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z')

get_index(){
    char=$1; 
    if [[ ${lower[@]} =~ $char ]]; then
        for (( i=0; i<${#lower[@]}; i++ )); do
            if [ ${lower[$i]} = $char ]; then  echo "$i" ; fi
        done
    else
        for (( i=0; i<${#upper[@]}; i++ )); do
            if [ ${upper[$i]} = $char ]; then  echo "$i" ; fi
        done
    fi
}


main(){
    string=$1; offset=$2; re1='[0-9]'; re2="[.!,']" output=""

    for (( i=0; i<${#string}; i++ )); do
        char=${string:$i:1}
        [[ $char = ' ' ]] && output+=' ' && continue
        [[ $char =~ $re1 ]] && output+="$char" && continue
        [[ $char =~ $re2 ]] && output+="$char" && continue
        index=$( get_index "$char" )
        new_index=$(( index+offset ))
        [[ "$new_index" -gt 25 ]] && new_index=$(( new_index%26 ))
        [[ ${upper[@]} =~ $char ]] && output+=${upper[$new_index]} \
            || output+=${lower[$new_index]}
    done
    echo "$output"
}

main "$@"
