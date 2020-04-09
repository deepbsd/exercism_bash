#!/usr/bin/env bash

actions=( 'wink' 'double blink' 'close your eyes' 'jump' )
reverse_actions=( 'jump' 'close your eyes' 'double blink' 'wink' )


main(){
    result=()
    count=0; num=$1; bits=''
    while [[  $num -ne 0 ]]; do
        (( $num & 1 )) && bits="1$bits" || bits="0$bits"
        [[ "${bits:0:1}" == "1" ]] && result+=("${actions[$count]}") 
        #echo "count: $count  num: $num  bits: $bits result: $result"
        num=$(( num >> 1 )) && ((count++))
    done
    [[ "${#result}" -gt 1 ]] && printf ",%s" "${result[@]}" | \
        sed 's/^,//g' || echo "${result[@]}"
}

main "$@"
