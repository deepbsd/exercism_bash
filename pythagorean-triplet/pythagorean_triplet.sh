#!/usr/bin/env bash

make_set(){
    this_set=$(( for val in "$@"; do echo "$val"; done| sort| uniq| xargs ))
    echo "${this_set[@]}"
}

primitive_triplets(){
    number_in_triplet=$1
    declare -a triplet=() triplets=()
    declare -A setTriplets=()

    big_start=$(( number_in_triplet**0.5 ))
    big_end=$(( number_in_triplet**2 ))

    for number in {$big_start..$big_end}; do
        start=$(( number**0.5 ))
        end=$(( number**2 ))

        triplet=$( triplets_in_range "$start" "$end" )
        
        [[ " ${triplet[@]} " =~ "${number_in_triplet}" ]] && triplets+=( $triplet )
    done
    setTriplets=$( make_set "${triplets[@]}" )
    echo "${setTriplets[@]}"
}

triplets_in_range(){
    range_start=$1
    range_end=$2
    triplets=()
#    for x in range(range_start, range_end+1):
#        for y in range(range_start, range_end+1):
#            for z in range(range_start, range_end+1):
#                if is_triplet((x,y,z)):
#                    if triplets.count(tuple(sorted((x,y,z)))) < 1:
#                        triplets.append(tuple(sorted((x,y,z))))
#                        print("triplets: ", triplets)
#    return set(triplets)


#    for x in {$range_start..$range_end}; do
#        for y in {$range_start..$range_end}; do
#            for z in {$range_start..$range_end}; do
#                [[ is_triplet "$x" "$y" "$z" ]] && \
#                    [[ sorted( x y z ) not already in triplets ]] && \
#                    triplets+=( "$x" "$y" "$z" )
#
#            done
#        done
#    done
#    echo "${triplets[@]}"
}

is_triplet(){
    declare -a triplet
    triplet=( $1 $2 $3 )
    IFS=$'\n' triplet=($(sort<<<"${triplet[*]}"))
    unset IFS
    if [[ $((${triplet[0]}**2 + ${triplet[1]}**2)) == $((${triplet[2]}**2)) && $((${triplet[0]}<${triplet[1]}<${triplet[2]})) ]] ; then
        return 0
    else
        return 1
    fi
}

#primitive_triplets "$@"
is_triplet "$@"
