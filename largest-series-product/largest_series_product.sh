#!/usr/bin/env bash


main(){
    numbers=$1
    length=$2
    [ -z "$numbers" -o -z "$length" ] && echo 1 && exit 0
    echo "length of numbers: ${#numbers} length: ${length}"
    [ "${#numbers}" -lt "$length" ] && echo "span must be smaller than string length" && exit 1
    declare -a number_arr
    max_product=0; product=1
    for (( num=0; num<${#numbers}; num++ )); do
        digit="${numbers:$num:1}"
        number_arr+=($digit)
    done
    echo "number_arr: ${number_arr[@]}  length: $length"
    for (( n=0; n<${#number_arr[@]}-$length+1; n++ )); do
        short_arr=( "${number_arr[@]:$n:$length}" )
        for (( short=0; short<"${#short_arr[@]}"; short++ )); do
            product=$(( $product*${short_arr[$short]} ))
        done
        echo "short_arr: ${short_arr[@]}"
        [ "$product" -gt "$max_product" ] && max_product="$product"
        product=1
        echo "max_product: $max_product"
    done

    echo "$max_product"
}

main "$@"
#main 576802143 2
#main 1234 2
#main 0
