#!/usr/bin/env bash

declare -A weekdays=( [Sunday]=0  [Monday]=1 [Tuesday]=2 [Wednesday]=3 [Thursday]=4 [Friday]=5 [Saturday]=6 )

declare -A ranges=( [1st]=arrayOfDates[0] [teenth]=$(arrayOfDates.find( date => date > 12)) 
    [2nd]=arrayOfDates[1]  [3rd]=arrayOfDates[2] [4th]=arrayOfDates[3] [5th]=arrayOfDates[4] 
    [last]=arrayOfDates[arrayOfDates.length-1] )



main(){
    yr=$1; month=$2; which=$3; day=$4
}
main "$@"
