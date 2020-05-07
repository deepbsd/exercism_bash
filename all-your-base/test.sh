#!/usr/bin/env bash

set -o errexit
set -o nounset

fromBtoBase10(){
    n=( $1 )
    local -i from_base=$2
    local -i res=0
    local -i j=${#n[@]}-1

    for i in "${n[@]}"; do
        (( $i>=$from_base )) || (( $i<0 )) && { echo "Invalid number format"; exit 1; }
        res+="$(( $i*($from_base**$j) ))"
        j=$j-1
    done

    echo "$res"
}

from10toBaseB(){
    local -i n=$1
    local -i to_base=$2

    (( $n<=0 )) && { for (( i=${#num_in_B[@]}-1; i>=0; i-- )); do echo -n "${num_in_B[$i]} "; done; exit; }

    num_in_B+=( $(( $n % $to_base )) )

    from10toBaseB $n/$to_base $to_base
}

main(){
    (( $1 <= 1 || $3 <= 1 )) && { echo "Bases have to be greater than 1"; exit 1; }

    n_10=$(fromBtoBase10 "$2" $1) || { echo "$n_10"; exit 1; }

    num_in_B=()
    echo $(from10toBaseB "$n_10" $3)
}

main "$@"
