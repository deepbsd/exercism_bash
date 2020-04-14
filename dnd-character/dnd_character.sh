#!/usr/bin/env bash

declare -A abilities=( [strength]=0 [dexterity]=0 [constitution]=0 [intelligence]=0 [wisdom]=0 [charisma]=0 )

get_roll(){  # four simulated dice
    r1=$(( RANDOM % 6 + 1 )); r2=$(( RANDOM % 6 + 1 )); r3=$(( RANDOM % 6 + 1 ))
    r4=$(( RANDOM % 6 + 1 )); tot=0
    for n in $(echo "$r1 $r2 $r3 $r4" | grep -o . | sort -rn | head -3); do
        ((tot+=n))
    done
    echo "$tot"
}

generate(){
    for key in "${!abilities[@]}"; do
        abilities[$key]=$(get_roll)
        echo "$key ${abilities[$key]}"
    done
    echo "hitpoints $(hitpoints)"
}

modifier(){
    local score=$1
    echo $(((score-10)/2))
}

hitpoints(){
    echo "$((${abilities[constitution]} + 10))"
}

main(){
    method=$1; [[ -n $2 ]] && score=$2 

    [[ $method =~ modifier ]] && modifier "$score"
    [[ $method =~ generate ]] && generate

}
main "$@"
