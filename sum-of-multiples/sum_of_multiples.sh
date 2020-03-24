#!/usr/bin/env bash

main(){
    sum=0
    limit=$1
    shift
    numbers_arr="$@"
    factors_arr=()
    for number in ${numbers_arr[@]} ; do
        for (( i=1; i<=$limit; i++ ))
        do
            [[ $(( $i % $number )) == 0 ]] && \
                [[ ! ${factors_arr[@]} =~ "$i" ]] && \
                factors_arr+=( "$i" )
        done
    done

    echo ${factors_arr[@]}

    for factor in "${factors_arr[@]}" ; do
        let sum=sum+factor
    done

    echo $sum




}

#main 10 3 5
#main "$@"

