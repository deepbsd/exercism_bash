#!/usr/bin/env bash

contains_element(){
    local el match=$1
    shift
    for el; do [[ "$el" == "$match" ]] && return 0; done
    return 1
}

main(){
    sum=0
    limit=$1
    shift
    factors_arr=()
    for number in "$@" ; do
        [[ $number -eq 0 ]] && continue
        for (( i=1; i<$limit; i++ )) ; do
            [[ $(( $i % $number )) == 0 ]] && \
                #[[ ! ${factors_arr[@]} =~ " $i " ]] && \
                ! contains_element $i "${factors_arr[@]}" && \
                factors_arr+=( "$i" )
        done
    done

    #echo ${factors_arr[@]}

    for factor in "${factors_arr[@]}" ; do
        let sum=sum+factor
    done

    echo $sum
}

#main 4 3 0
main "$@"

