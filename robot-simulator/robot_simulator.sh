#!/usr/bin/env bash

directions=( 'north' 'east' 'south' 'west' )

main(){
    [[ -z $1 ]] && NS=0 || NS=$1; 
    [[ -z $2 ]] && EW=0 || EW=$2; 
    [[ -z $3 ]] && bearing='north' || bearing=$3
    [[ -z $4 ]] && args='' || args=$4

    echo "$NS $EW $bearing"
}
main "$@"
