#!/usr/bin/env bash

primitive_triplets(){
    number_in_triplet=$1
    declare -a triplets=()
    declare -A setTriplets=()

    big_start=$(( number_in_triplet**0.5 ))
    big_end=$(( number_in_triplet**2 ))

    for number in {$big_start..$big_end}; do
        start=$(( number**0.5 ))
        end=$(( number**2 ))

        triplet=$( triplets_in_range "$start" "$end" )
        
        [[ " ${triplet[@]} " =~ "${number_in_triplet}" ]] && triplets+=( $triplet )
    done
    setTriplets=($(for trip in "${triplets[@]}"; do echo "$trip";done| sort| uniq| xargs ))
    echo "${setTriplets[@]}"
}

triplets_in_range(){
    range_start=$1
    range_end=$2
    triplets = []
    for x in range(range_start, range_end+1):
        for y in range(range_start, range_end+1):
            for z in range(range_start, range_end+1):
                if is_triplet((x,y,z)):
                    if triplets.count(tuple(sorted((x,y,z)))) < 1:
                        triplets.append(tuple(sorted((x,y,z))))
                        print("triplets: ", triplets)
    return set(triplets)
}

is_triplet(triplet){
    triplet = sorted(triplet)
    return triplet[0]**2 + triplet[1]**2 == triplet[2]**2 and triplet[0]<triplet[1]<triplet[2]
}

primitive_triplets "$@"
