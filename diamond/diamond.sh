#!/usr/bin/env bash

alphabet=( {A..Z} )

get_index(){
    char=$1

    
    for (( i=0; i<${#alphabet}; i++ )); do
        echo "trying: $i"
        [[ $char == ${alphabet[$i]} ]] && echo $n && break
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

create_dots(){
    char=$1; number=$(get_index $char); dots=''; line='';

    echo "index: $number"

    for ((i=0; i<$number; i++)) {
        [[ $i -lt 1 ]] && line="${alphabet[$i]}" && echo $line && continue
        dots+='.'
        line="${alphabet[$i]}${dots}${alphabet[$i]}"
        echo $line
    }
    for ((i=${#dots}-1; i>=0; i--)){
        dots=${dots%.}
        line="${alphabet[$i]}${dots}${alphabet[$i]}"
        [[ $i -lt 1 ]] && line="${alphabet[$i]}" && echo $line && continue
        echo $line

    }
}

main(){
    letter=$1; index=$(get_index $letter); local output

    create_dots $letter && exit 0
    
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
