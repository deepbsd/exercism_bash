#!/usr/bin/env bash

error(){
    echo "false" && exit 0
}

main(){

    position_num=10
    declare -i product; product=0

    input_arr=(`echo $1 | sed 's/[ -]//g' | grep -o .`)

    length=${#input_arr[@]}
    (( $length != 10 )) && error


    end_char=${input_arr[$length-1]}
    echo "$end_char"
    [[ $end_char  =~ "012345677890X" ]] || error



    #echo ${input_arr[@]}

    for num in ${input_arr[@]} ; do
        if [ $num == 'X' ]; then
            num=10
        fi
        product+=$((position_num*num))
        #echo "$position_num $product"
        ((position_num--))
    done

    #echo $product

    (( product % 11 == 0 )) && echo 'true' || error

    return 0
}


#main "$@"

main "3-598-21508-8"
#main "3-598-21508-9"
