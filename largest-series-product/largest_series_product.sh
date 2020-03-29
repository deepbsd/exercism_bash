#!/usr/bin/env bash

main(){
    numbers=$1
    length=$2
    declare -a number_arr
    max_product=0
    for (( num=0; num<${#numbers}; num++ )); do
        digit="${numbers:$num:1}"
        number_arr+=($digit)
    done
    #echo "${number_arr[@]}"
    for (( n=0; n<${#number_arr[@]}; n++ )); do
        next="${number_arr[$n+1]}" || next=""
        #echo "next: $next"
        [ ! -z "$next" ] && product=$((${number_arr[$n]}*$next))
        #echo "product: ${product}"
        [ "$product" -gt "$max_product" ] && max_product="$product"
        #echo "max_product: $max_product"
    done

    echo "$max_product"
}

main "$@"
