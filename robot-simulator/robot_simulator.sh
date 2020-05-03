#!/usr/bin/env bash

declare -a directions=( 'north' 'east' 'south' 'west' )
declare -A bearings=( [north]=0 [east]=1 [south]=2 [west]=3 )

advance(){
    echo "$1"
}

main(){
    [[ -z $1 ]] && NS=0 || NS=$1; 
    [[ -z $2 ]] && EW=0 || EW=$2; 
    [[ -z $3 ]] && bearing='north' || bearing=$3
    [[ -z $4 ]] && args='' || args=$4

    [[ -n $4 ]] && \
    for c in "$args"; do
        #echo "bearing_index: ${bearings[$bearing]}"
        case $args in
            'R') let "index = (${bearings[$bearing]} + 1) % 4" 
                #echo "new_index: $index"
                bearing="${directions[ $index ]}" ;;
                #echo "index: $index old_bearing: $3 new_bearing: $bearing";;
            'L') let "index = (${bearings[$bearing]} - 1) % 4"
                #echo "new_index: $index"
                bearing="${directions[ $index ]}" ;;
                #echo "index: $index old_bearing: $3 new_bearing: $bearing";;
            'A') advance "$bearing" ;;
             * ) echo "Argument $c not valid."
        esac
    done

    echo "$NS $EW $bearing"
}
main "$@"
