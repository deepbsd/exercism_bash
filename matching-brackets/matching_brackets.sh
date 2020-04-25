#!/usr/bin/env bash

declare -A pairs=( ['{']='}' ['[']=']' ['(']=')' )
declare -a openers=( '{' '[' '(' )
declare -a closers=( '}' ']' ')' )
declare -a stack=()

say_true(){ echo true && exit 0; }
say_false(){ echo false && exit 0; }

index_of(){
    for (( i=0; i<${#closers[@]}; i++ )){
        [[ $1 == ${closers[$i]} ]] && echo $i
    }
}

main(){
    input=$1; stack_dup=()
    for ((c=0; c<${#input}; c++)){
        [[ [\(\)[]{}] =~ "${input:$c:1}" ]] && stack+=( "${input:$c:1}" )
    }
    #stack_dup+=( "${stack[@]}" )
    #echo "stack_dup: ${stack_dup[@]} length: ${#stack_dup[@]}"
    [[ ${stack:0:1} != "" && ${closers[@]} =~ ${stack:0:1} ]] && say_false
    #echo "stack: ${stack[@]} length: ${#stack[@]}"
    for (( i=0; i<${#stack[@]}; i++ )); do
        c=${stack[$i]}
        #echo "index: $i  c: $c  closers: ${closers[@]} closers_c_idx: ${closers[$(index_of $c)]}"
        #echo "closer: ${closers[$(index_of $c)]}   pairs[closer]: ${pairs[${openers[$(index_of $c)]}]}"
        #echo "previous in stack: ${stack[$i-1]}"
        if [[ "${closers[@]}" =~ "$c" ]]; then
            #echo 'closer'
            if [[ ${closers[$(index_of $c)]} == ${pairs[${openers[$(index_of $c)]}]} && 
                ${stack[$i-1]} == ${openers[$(index_of $c)]} ]]; then
                #echo "unsetting index: $i and $((i-1))"
                unset "stack[$i]" && unset "stack[$((i-1))]"
            fi
        fi
    done
    #echo "stack length: ${#stack[@]} stack: ${stack[@]}"
    [[ ${#stack[@]} -eq 0 ]] && say_true || say_false
}
main "$@"
