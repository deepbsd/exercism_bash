#!/usr/bin/env bash

declare -A pairs=( ['{']='}' ['[']=']' ['(']=')' )
declare -a openers=( '{' '[' '(' )
declare -a closers=( '}' ']' ')' )
declare -a stack=()

say_true(){ echo true && exit 0; }
say_false(){ echo false && exit 0; }
error(){ echo 'invalid input' && exit 1; }

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

    for c in $( echo ${stack[@]} | rev ) ; do
        if [[ ${closers[@]} =~ "$c" ]]; then
            if [[ ${closers[$(index_of $c)]} -eq ${pairs[${openers[$(index_of $c)]}]} ]]; then
                unset 'stack[-1]' && unset 'stack[-1]'
            fi
        fi
    done

}
main "$@"