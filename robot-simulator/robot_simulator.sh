#!/usr/bin/env bash

directions=( 'north' 'east' 'south' 'west' )
north=0; east=1; south=2; west=3;

main(){
    [[ -z $1 ]] && NS=0 || NS=$1; 
    [[ -z $2 ]] && EW=0 || EW=$2; 
    [[ -z $3 ]] && bearing='north' || bearing=$3
    [[ -z $4 ]] && args='' || args=$4

    [[ -n $4 ]] && \
    for c in "$args"; do
        case $args in
            'R') bearing="${directions[1]}";;
            * ) bearing="${bearing}";;
        esac
    done

    echo "$NS $EW $bearing"
}
main "$@"
