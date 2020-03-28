#!/usr/bin/env bash

actors=(
1 'the house that Jack built.'
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

recite(){
    verse=$1; last=$2; 
    [ $last -gt $verse ] || [ $last -eq $verse ] || error
    [ $verse -gt 0 ] && [ $last -gt 0 ] || error
    msg=()
    msg+=$(printf "This is %s\n" "${actors[$verse]}")
    while [ "$verse" -gt 1 ] ; do
      msg+=$(printf "\nthat %s\n" "${verbs[$verse-1]} ${actors[$verse-1]}")
      ((verse--))
    done

    verse=$1  # reset the verse number
    for line in "${msg[@]}"; do
        [ $verse -ne $last ] && printf "%s\n\n" "$line" || printf "%s\n" "$line"
    done
}

main(){
    count=$1 ; last=$2
    [[ ! "$last" -ge "$count" ]] && error
    [[ "$last" -eq 13 ]] && error
    while [[ "$last" -ge "$count" ]]; do
        recite "$count" "$last" 
        let count=$count+1
    done
}

main "$@"
