#!/usr/bin/env bash

main(){
    letter=$1
    let_arr=()
    output=()
    for letr in [a..${letter}]; do
        let_arr+=( "$letr" )
    done
    
    single=true; space=""; line=""
    for ((i=0; i<${#let_arr}; i++)); do
        [[ "$single" ]] && line+="${let_arr[$i]}" && output+=( "$line" )
        if [[ ! "$single" ]]; then 
            space=" "; single=false
            line+="${let_arr[$i]}${space}${let_arr[$i]}"
            output+=( "$line" )
        fi
    done

    for (( i="${#let_arr}-1"; i>=0; i-- )); do
       echo          
    done



}



main "$@"
