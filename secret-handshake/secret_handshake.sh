#!/usr/bin/env bash

actions=( 'wink' 'double blink' 'close your eyes' 'jump' )
reverse_actions=( 'jump' 'close your eyes' 'double blink' 'wink' )

main(){
    result=""
    count=0
    num=$1
    while [[ $(( num >> 1 )) -gt 0 ]]; do
        num=$(( num >> 1 )) && ((count++))
        result="${actions[$count]}"
    done
    if [[ $(( num >> 1 )) -eq 0 ]]; then result="${actions[$count]}"; fi
    echo "$result"
}

#old_main(){
#    result=()
#    binary=$(bc <<< "obase=2;$1")    
#    length=${#binary}
#    #echo "binary: $binary"
#    reversebin=$( echo "$binary" | rev )
#    echo "reverse: $reversebin"
#    for ((x=0; x<${#reversebin}; x++)); do
#        echo "action: ${actions[$x]} x: $x"
#        [[ "${reversebin[$x]}" -eq 1 ]] && result+=( "${actions[$x]}" )
#    done
#
#    echo "${result[@]}"
#}
main "$@"
