#!/usr/bin/env bash

actors=(
1 'the house that Jack built'
'the malt' 'the rat' 'the cat'
'the dog' 'the cow with the crumpled horn'
'the maiden all forlorn'
'the man all tattered and torn'
'the priest all shaven and shorn'
'the rooster that crowed in the morn'
'the farmer sowing his corn'
'the horse and the hound and the horn'
)
verbs=(
1 'lay in' 'ate' 'killed' 'worried'
'tossed' 'milked' 'kissed' 'married'
'woke' 'kept' 'belonged to'
)

error(){
    echo "invalid" && exit 1
}

main(){

    verse=$1; last=$2; 
    [ $last -gt $verse ] || [ $last -eq $verse ] || error
    msg=()
    msg+=$(printf "This is %s\n" "${actors[$verse]}")
    while [ $verse -gt 1 ] && [ "$last" -ge "$verse" ]; do
      msg+=$(printf "\nthat %s\n" "${verbs[$verse-1]} ${actors[$verse-1]}")
      ((verse--))
    done

    #echo "length: ${#msg[@]}"

    for line in "${msg[@]}"; do
        printf "%s\n" "$line"
    done

}

#main "$@"
main 7 8
