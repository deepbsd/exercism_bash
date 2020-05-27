#!/usr/bin/env bash

generateRows(){
    declare -i num=$1 i
    declare -a rows
    for ((i=0; i<$num; i++)); do
        declare -a newRow
        for ((col=0; col<=$i; col++)); do
            if ( $col==$i || $col==0 ); then { newRow+=( 1 ); } 
            else {  newRow+=( ${rows[$i-1][$col-1]}+${rows[$i-1][$col]});  } 
            fi
        done
        rows+=( "${newRow[@]}" )
    done
    echo "${rows[@]}"
}

main(){
    generateRows "$1"
    #constructor(num){
    #    this.rows = this.generateRows(num);
    #    this.lastRow = this.rows[num-1];
    #}
}

main "$@"
