#!/usr/bin/env bash

main(){
    sum=0
    limit=$1
    shift
    factors_arr=()
    for number in "$@" ; do
        for (( i=1; i<$limit; i++ )) ; do
            [[ $(( $i % $number )) == 0 ]] && \
                # I'm probably gonna have to loop over and
                # compare each element after all.
                [[ ! ${factors_arr[@]} =~ " $i " ]] && \
                factors_arr+=( "$i" )
        done
    done

    #echo ${factors_arr[@]}

    for factor in "${factors_arr[@]}" ; do
        let sum=sum+factor
    done

    echo $sum




}

#main 51 5 25
main "$@"

