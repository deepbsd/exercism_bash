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
        [[ $((number%n)) -eq 0 ]] && factors+=("$n")    
        #number=$((number/$n))
    done
    #echo "factors: ${factors[@]}"
}

get_sum(){
    sum=0
    for num in "${factors[@]}"; do let sum+="$num"; done
    echo "$sum"
}

is_prime(){
    check=$(((($1**2)+17)%12))
    #[[ ${#factors[@]} -ne 1  ]] && return 1
    [[ $check -eq 6 ]] && return 0
    return 1
}

main(){
    input_num=$1
    [[ $input_num -le 0 ]]  && error && exit 1
    [[ $(is_prime "$input_num") ]] && echo "deficient" && exit 0
    get_factors "$input_num"
    sum=$(get_sum "$input_num")
    [[ "$sum" -eq "$input_num" ]] && echo "perfect" && exit 0
    [[ "$sum" -lt "$input_num" ]] && echo "deficient" && exit 0
    echo "abundant" && exit 0
}

main "$@"
