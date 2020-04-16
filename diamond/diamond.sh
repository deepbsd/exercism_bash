#!/usr/bin/env bash


main(){
    letter=$1
    let_arr=()
    output=()
    for letter in $(IFS=' '; eval echo {A..$letter}); do
        let_arr+=( "$letter" )
    done
    
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
