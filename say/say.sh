#!/usr/bin/env bash

die(){ echo $1 && exit 1; }

declare -a up2_20=( 'zero' 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine' 'ten' 'eleven'
'twelve' 'thirteen' 'fourteen' 'fifteen' 'sixteen' 'seventeen' 'eighteen' 'nineteen' 'twenty' )

declare -A twenty_90=( [20]='twenty' [30]='thirty' [40]='forty' [50]='fifty' [60]='sixty' [70]='seventy'
[80]='eighty' [90]='ninety' )


function twenty_to_100() {
    local num=$1; s1="${num:0:1}"; s2=${num:1}
    echo "${twenty_90[$((s1*10))]}-${up2_20[s2]}" && exit 0
}

function hundreds() {
    local num=$1; s1="${num:0:1}"; s2=${num:1}
    [[ $s2 -le 20 ]] && s2="${up2_20[$s2]}" || s2=$( twenty_to_100 "$s2" )
    [[ $num =~  ^(100|200|300|400|500|600|700|800|900)$ ]] && echo "${up2_20[s1]} hundred" && exit 0
    echo "${up2_20[s1]} hundred $s2" && exit 0
}

function large_nums(){
    local -i num slice_size multiplier; local measurement; declare -a even_array=()
    num=$1; slice_size=$2; measurement=$3; multiplier=$4
    s1=${num:0:slice_size}; s2=${num:slice_size}

    [[ $s1 -le 20 ]] && s1=${up2_20[s1]} || s1=$( main "$s1" )  ## here's where recursion happens
    for ((i=0; i<=9; i++)){ even_array+=( $(( $i * $multiplier )) ); } # create array of 000's
    [[ "${even_array[@]}" =~ $num ]] && echo "$s1 $measurement" && exit 0
    s2=$( main "$s2" ) && echo "$s1 $measurement $s2" && exit 0   ## more recursion...

}

main(){
    declare -i num=$1
    [[ $num -lt 0 || $num -ge 1000000000000 ]] && die "Number must be between 0 and 999,999,999,999."
    [[ $num -ge 0 && $num -le 20 ]] && echo "${up2_20[$num]}" && exit 0
    [[ $num -ge 20 && $num -lt 100 ]] && twenty_to_100 "$num"
    [[ $num -ge 100 && $num -lt 1000 ]] && hundreds "$num"
    [[ $num -ge 1000 && $num -lt 1000000 ]] && large_nums "$num" 3 'thousand' 1000
}
main "$@"
