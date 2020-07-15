#!/usr/bin/env bash

main(){
    for (( a=0; a<=$1/3; a++ )); do
        for (( b=a+1; b<$1/2; b++ )); do
            c=$(($1-a-b))
            if (( a**2 + b**2 == c**2 )); then
                triplets+=( "$a,$b,$c" )
            fi
        done
    done
    for triplet in "${triplets[@]}"; do echo $triplet; done | sort -n
}


make_set(){
    this_set=$(( for val in "$@"; do echo "$val"; done| sort| uniq| xargs ))
    echo "${this_set[@]}"
}

primitive_triplets(){
    number_in_triplet=$1
    declare -a triplet=() triplets=()
    declare -A setTriplets=()

    big_start=$( bc <<< "scale=0; sqrt($number_in_triplet)" )
    big_end=$(( number_in_triplet**2 ))

    for number in $(seq $big_start $big_end); do
        start=$( bc <<< "scale=0; sqrt($number)")
        end=$( echo "$number^2" | bc )

        echo "Start/End:  $start $end  Number: $number"

        triplet=$( triplets_in_range $start $end )

        
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


for x in $(seq $range_start $range_end); do
    for y in $(seq $range_start $range_end); do
        for z in $(seq $range_start $range_end); do
                [[ $(is_triplet $x $y $z) == 0 ]] && \
                    triplet=( $x $y $z ) && \
                    IFS=$'\n' triplet=($(sort<"${triplet[*]}")) && \
                    unset IFS && \
                    [[ ! ${triplets[@]} =~ " ${triplet[@]} " ]] && \
                    triplets+=( $x $y $z )

            done
        done
    done
    echo "${triplets[@]}"
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

main "$@"
#primitive_triplets "$@"
#is_triplet "$@"
#triplets_in_range "$@"



