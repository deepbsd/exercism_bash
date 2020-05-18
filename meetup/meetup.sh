#!/usr/bin/env bash

declare -A weekdays=( [sunday]=0  [monday]=1 [tuesday]=2 [wednesday]=3 [thursday]=4 [friday]=5 [saturday]=6 )


declare -a array_of_dates=()

get_weekday_dates(){
    indate=$(date +%F -d "$1")
    for n in $(seq 1 31); do
        if [[ $(date +%w -d "$indate") == ${weekdays[$2]} ]] ; then
            array_of_dates+=( "$indate" ) 
        fi
        indate=$(date -d "$indate + 1 day")
    done
}

main(){
    yr=$1; month=$2; which=$3; weekday=${4,,}
    firstDate_of_month=$(date -d "${yr}-${month}-01")

    get_weekday_dates "$firstDate_of_month" "$weekday"

    declare -A ranges=( [1st]=${array_of_dates[0]} [teenth]=${array_of_dates[1]} [2nd]=${array_of_dates[1]}
    [3rd]=${array_of_dates[2]} [4th]=${array_of_dates[3]} [5th]=${array_of_dates[4]} [last]=${array_of_dates[-1]})
    
    date +%F -d "${ranges[$which]}"
}
main "$@"
