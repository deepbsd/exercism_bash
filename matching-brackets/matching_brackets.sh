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

#pop2(){
#    arr=( "$@" )
#    echo "before: arr: ${arr[@]} length: ${#arr[@]}"
#    for (( i=0; i<${#arr{@}}; i++ )); do
#        c=${arr[$i]}
#        if [[ "${closers[@]}" =~ "$c" ]]; then
#            if [[ ${closers[$(index_of $c)]} == ${pairs[${openers[$(injdex_of $c)]}]} 
#                && ${stack[$i-1]} == ${openers[$(index_of $c)]} ]]; then
#                unset ${arr[$i-1]} && unset ${arr[$i-1]}
#            fi
#        fi
#    done
#    unset arr[-1]
#    unset arr[-1]
#    echo "after: "
#    echo "${arr[@]}"
#}

main(){
    input=$1; stack_dup=""
    for ((c=0; c<${#input}; c++)){
        [[ [\(\)[]{}] =~ "${input:$c:1}" ]] && stack+="${input:$c:1}"
    }
    echo "stack: ${stack} length: ${#stack}"
    [[ ${stack:0:1} != "" && ${closers[@]} =~ ${stack:0:1} ]] && say_false
    echo "stack: ${stack} length: ${#stack}"
    for (( i=0; i<${#stack}; i++ )); do
        c=${stack:$i:1}
        echo "index: $i  c: $c  closers: ${closers[@]} closers_c_idx: ${closers[$(index_of $c)]}"
        echo "closer: ${closers[$(index_of $c)]}   pairs[closer]: ${pairs[${openers[$(index_of $c)]}]}"
        echo "previous in stack: ${stack:$i-1:1}"
        if [[ "${closers[@]}" =~ "$c" ]]; then
            echo 'closer'
            if [[ ${closers[$(index_of $c)]} == ${pairs[${openers[$(index_of $c)]}]} && 
                ${stack:$i-1:1} == ${openers[$(index_of $c)]} ]]; then
                echo "unsetting index: $i and $((i-1))"
                
                stack_dup="${stack_dup:0:$i-1}${stack_dup:$i+1}"
                echo "Stack_dup after: ${stack_dup}"
            fi
        fi
    done
    echo "stack length: ${#stack_dup} stack_dup: ${stack_dup}"
    [[ ${#stack_dup} -eq 0 ]] && say_true || say_false
}
main "$@"
