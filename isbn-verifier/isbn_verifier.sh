#!/usr/bin/env bash

main(){
    position_num=10
    declare -i product; product=0

    input_arr=(`echo $1 | sed 's/[ -]//g' | grep -o .`)

    #echo ${input_arr[@]}

    for num in ${input_arr[@]} ; do
        product+=$((position_num*num))
        #echo "$position_num $product"
        ((position_num--))
    done

    #echo $product

    (( product % 11 == 0 )) && echo 'true' || echo 'false'

    return 0
}


main "$@"

#main "3-598-21508-8"
#main "3-598-21508-9"
