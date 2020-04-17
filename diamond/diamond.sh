#!/usr/bin/env bash

alphabet=( {A..Z} )

get_index(){
    char=$1
    for (( i=0; i<${#alphabet}; i++ )); do
        [[ $char == ${alphabet[$i]} ]] && echo $n
    done
}

make_space(){
    num=$1; local output=""
    for (( n=0; n<$num; n++ )); do
        output+=" "
    done
    echo $output
}

create_line(){
    char=$1; spaces=$2
    this_space=$(make_space $spaces)
    echo $($this_space$char$this_space$char$this_space)
}

main(){
    letter=$1; index=$(get_index $letter); local output

    
    single=true; local space=""; local line=""
    for ((i=0; i<${#let_arr}; i++)); do
        [[ "$single" ]] && line+="${let_arr[$i]}" && output+=( "$line" )
        if [[ ! "$single" ]]; then 
            space=" "; single=false
            line+="${let_arr[$i]}${space}${let_arr[$i]}"
            output+=( "$line" )
            echo "$output"
        fi
    done

    for (( i="${#let_arr}-1"; i>=0; i-- )); do
       line="${space}${let_arr[$i]}${space}"
       echo "$output"
    done



}



main "$@"
