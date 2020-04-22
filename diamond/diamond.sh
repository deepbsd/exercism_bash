#!/usr/bin/env bash

declare -a alphabet=( {A..Z} )

get_index(){
    char=$1
    #echo "length: ${#alphabet[@]} char: $char" 
    for (( i=0; i<${#alphabet[@]}; i++ )); do
        #echo "trying: ${alphabet[$i]}"
        [[ $char == ${alphabet[$i]} ]] && echo $i && break
    done
}

make_space(){
    num=$1; local output=""
    for (( n=0; n<$num; n++ )); do
        output+="."
    done
    echo $output
}

create_line(){
    char=$1; spaces=$2
    this_space=$(make_space $spaces)
    echo $($this_space$char$this_space$char$this_space)
}

create_dots(){
    char=$1; number=$(get_index $char); dots='.'; line='';
    half_length=$(((number/2)+(number/2)+1))

    for (( i=0; i<=${number}; i++ )) {
        #echo "spaces: $spaces"
        spaces=$(make_space $half_length)
        [[ $i -lt 1 ]] && line="${alphabet[$i]}" && echo "${spaces}$line" && half_length=$((--half_length)) && continue
        line="${spaces}${alphabet[$i]}${dots}${alphabet[$i]}"
        echo $line
        dots+='..'
        half_length=$((--half_length))
    }
    dots=${dots%..}
    #half_length=$((((number+3)/2)+1))
    #spaces=$(make_space $half_length)
    for ((i=$number-1; i>=0; i--)){
        spaces+="."
        dots=${dots%..}
        line="${spaces}${alphabet[$i]}${dots}${alphabet[$i]}"
        [[ $i -lt 1 ]] && line="${alphabet[$i]}" && echo ${spaces}$line && continue
        echo $line
    }
}

main(){
    letter=$1; index=$(get_index $letter); local output


    create_dots $letter && exit 0
    
    #single=true; local space=""; local line=""
    #for ((i=0; i<${#let_arr}; i++)); do
    #    [[ "$single" ]] && line+="${let_arr[$i]}" && output+=( "$line" )
    #    if [[ ! "$single" ]]; then 
    #        space=" "; single=false
    #        line+="${let_arr[$i]}${space}${let_arr[$i]}"
    #        output+=( "$line" )
    #        echo "$output"
    #    fi
    #done

    #for (( i="${#let_arr}-1"; i>=0; i-- )); do
    #   line="${space}${let_arr[$i]}${space}"
    #   echo "$output"
    #done

    

}



main "$@"
