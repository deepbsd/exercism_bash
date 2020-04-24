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
    input=$1
    for ((c=0; c<${#input}; c++)){
        [[ [\(\)[]{}] =~ "${input:$c:1}" ]] && stack+=( "${input:$c:1}" )
    }
    echo "stack: ${stack[@]} length: ${#stack[@]}"
    for (( i=0; i<${#stack[@]}-1; i++ )); do
        c=${stack[$i]}
        echo "c: $c  closers: ${closers[@]}"
        echo "closer: ${closers[$(index_of $c)]}   pairs[closer]: ${pairs[${openers[$(index_of $c)]}]}"
        if [[ "${closers[@]}" =~ "$c" ]]; then
            echo 'closer'
            if [[ ${closers[$(index_of $c)]} == ${pairs[${openers[$(index_of $c)]}]} && 
                ${stack[$i-1]} == ${openers[$(index_of $c)]} ]]; then
                echo 'unsetting...'
                unset 'stack[-1]' && unset 'stack[-1]'
            fi
        fi
    done
    echo "stack length: ${#stack[@]}"
    [[ ${#stack[@]} -eq 0 ]] && say_true || say_false
}
main "$@"
