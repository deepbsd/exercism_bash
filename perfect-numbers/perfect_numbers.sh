#!/usr/bin/env bash

declare -a factors

error(){
echo "Classification is only possible for natural numbers."
exit 1
}

get_factors(){
    local number=$1; 
    for ((n=1; n<=$number; n++)); do
        [[ "$n" -eq "$number" ]] && continue
        [[ $((number%n)) == 0 ]] && factors+=("$n")
    done
    #echo "factors: ${factors[@]}"
}

get_sum(){
    sum=0
    for num in "${factors[@]}"; do let sum+="$num"; done
    echo "$sum"
}

is_prime(){
    local number=$1; limit=$(echo $((number/2)))
    for ((n=2; n<=$limit; n++)); do
        [[ $((number%n)) == 0 ]] && exit 1
        #echo $((number%n))
    done
    return 0
}

main(){
    input_num=$1
    get_factors "$input_num"
    sum=$(get_sum "$input_num")
    [[ "$sum" -eq "$input_num" ]] && echo "perfect" && exit 0
    [[ $(is_prime "$input_num") ]] && echo "deficient" && exit 0
    [[ "$sum" -lt "$input_num" ]] && echo "deficient" && exit 0
    echo "abundant" && exit 0
}

main "$@"
