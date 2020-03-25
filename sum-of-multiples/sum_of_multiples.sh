#!/usr/bin/env bash

main(){
    sum=0
    limit=$1
    shift
    factors_arr=()
    for number in "$@" ; do
        for (( i=1; i<$limit; i++ )) ; do
            echo "pass for  $number"
            [[ $(( $i % $number )) == 0 ]] && \
                # Problem! False positive for '5' and '25' or '25' in '125'
                # Might have to loop over each element in ${factors_arr}
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

main 100 3 5
#main "$@"

