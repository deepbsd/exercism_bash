#!/usr/bin/env bash

declare -A weekdays=( [Sun]=0  [Mon]=1 [Tue]=2 [Wed]=3 [Thu]=4 [Fri]=5 [Sat]=6 )

#declare -A ranges=( [1st]=arrayOfDates[0] [teenth]=$(arrayOfDates.find( date => date > 12)) 
#    [2nd]=arrayOfDates[1]  [3rd]=arrayOfDates[2] [4th]=arrayOfDates[3] [5th]=arrayOfDates[4] 
#    [last]=arrayOfDates[arrayOfDates.length-1] )




main(){
    yr=$1; month=$2; which=$3; weekday=$4
    firstDate_of_month=$(date -d "${yr}-${month}-01")

    first_weekday=${weekdays[$(echo $firstDate_of_month | cut -d' ' -f1)]}
    echo "first_weekday: ${first_weekday}"
}
main "$@"
