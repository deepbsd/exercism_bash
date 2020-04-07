#!/usr/bin/env bash

actions=( 'wink' 'double blink' 'close your eyes' 'jump' )
reverse_actions=( 'jump' 'close your eyes' 'double blink' 'wink' )


main(){
    result=()
    binary=$(bc <<< "obase=2;$1")    
    length=${#binary}
    #echo "binary: $binary"
    reversebin=$( echo "$binary" | rev )
    echo "reverse: $reversebin"
    for ((x=0; x<${#reversebin}; x++)); do
        echo "action: ${actions[$x]} x: $x"
        [[ "${reversebin[$x]}" -eq 1 ]] && result+=( "${actions[$x]}" )
    done

    echo "${result[@]}"
}
main "$@"
