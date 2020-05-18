#!/usr/bin/env bash

declare -A weekdays=( [sunday]=0  [monday]=1 [tuesday]=2 [wednesday]=3 [thursday]=4 [friday]=5 [saturday]=6 )

#declare -A ranges=( [1st]=arrayOfDates[0] [teenth]=$(arrayOfDates.find( date => date > 12)) 
#    [2nd]=arrayOfDates[1]  [3rd]=arrayOfDates[2] [4th]=arrayOfDates[3] [5th]=arrayOfDates[4] 
#    [last]=arrayOfDates[arrayOfDates.length-1] )

declare -a instances_in_month=()

get_weekday_dates(){
    indate=$(date +%F -d "$1")
    for n in $(seq 1 31); do
        [[ $(date +%w -d "$indate") == ${weekdays[$2]} ]] && \
            instances_in_month+=( "$indate" ) && \
            indate=$(date +%F -d "$indate+$n day")
        echo "indate: $indate"
    done

    echo "${instances_in_month[@]}"
}


main(){
    yr=$1; month=$2; which=$3; weekday=${4,,}
    firstDate_of_month=$(date -d "${yr}-${month}-01")

    get_weekday_dates $firstDate_of_month $weekday

    #first_weekday=${weekdays[$(echo $firstDate_of_month | cut -d' ' -f1)]}
    #echo "first_weekday: ${first_weekday}"
}
main "$@"
