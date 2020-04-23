#!/usr/bin/env bash

declare -A pairs=( ['{']='}' ['[']=']' ['(']=')' )
declare -a openers=( '{' '[' '(' )
declare -a closers=( '}' ']' ')' )
declare -a stack=()

say_true(){ echo true && exit 0; }
say_false(){ echo false && exit 0; }
error(){ echo 'invalid input' && exit 1; }

index_of(){
    for (( i=0; i<${#openers[@]}; i++ )){
        [[ $1 == ${openers[$i]} ]] && echo $i
    }
}

main(){
    input=$1
    for ((c=0; c<${#input[@]}; c++)){
        [[ [\[\]\(\){}] =~ $c ]] && stack+=( $c )
    }
    echo "${stack[@]}" 

}
main "$@"
