#!/usr/bin/env bash

main(){
    hours=$1*60*60; minutes=$2*60 
    total_seconds=$((hours+minutes))
    dateobj=$(date -d "today 00:00:00" )
    dateobj=$( date --date="$dateobj + $total_seconds seconds" +"%H:%M" )
    echo "$dateobj" 
}

main "$@"
