#!/usr/bin/env bash

declare -A codon_keys=( \
[AUG]=Methionine [UUU]=Phenylalanine \
[UUC]=Phenylalanine [UUA]=Leucine \
[UUG]=Leucine [UCU]=Serine [UCC]=Serine \
[UCA]=Serine [UCG]=Serine [UAU]=Tyrosine \
[UAC]=Tyrosine [UGU]=Cysteine [UGC]=Cysteine \
[UGG]=Tryptophan [UAA]=STOP [UAG]=STOP [UGA]=STOP)


main(){
    input=$1
    proteins=""
    start=0
    while [ "$input" != "" ]; do
        key=${input:0:3}
        #echo $key
        [[ ${codon_keys[$key]} == "STOP" ]] && break
        proteins+=" $(echo ${codon_keys[$key]})"
        input=${input:3}
    done

    echo "${proteins}" | sed 's/^ //g'
}

#main "UGC"
main "$@"
