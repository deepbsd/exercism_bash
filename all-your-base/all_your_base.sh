#!/usr/bin/env bash

main(){
    ibase=$1; obase=$3; number=$( echo "$2" | sed 's/ //g' ); total=0
    length=$((${#number}))
    #echo "number: $number length: $length"
    for ((i=0; i<${#number}; i++)){
        let total+="${number:$i:1} * $(($obase**(($length-1))))"
        ((length--))
        #echo "total: $total i: $i length: $length ibase: $ibase obase: $obase"
    }
    echo "$total"
}
main "$@"
