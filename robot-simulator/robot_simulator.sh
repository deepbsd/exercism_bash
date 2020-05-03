#!/usr/bin/env bash

directions=( 'north' 'east' 'south' 'west' )
bearings=( [north]=0 [east]=1 [south]=2 [west]=3 )

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
        case $args in
            'R') let "index=${bearings[ $bearing ]}" 
                echo "new_index: $index"
                bearing="${directions[ $index ]}" #;;
                echo "index: $index old_bearing: $3 new_bearing: $bearing";;
            'L') let index="${bearings[$3]}-1"
                bearing="${directions[ $index ]}" ;;
            'A') advance "$bearing" ;;
             * ) echo "Argument $c not valid."
        esac
    done

    echo "$NS $EW $bearing"
}
main "$@"
