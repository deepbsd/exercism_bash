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

main(){

    verse=$1
    msg=()
    msg+=(`printf "This is %s\n" "${actors[$verse]}"`)
    while [ $verse -gt 1 ]; do
      [ $verse -gt 0 ] && \
          msg+=(`printf "that %s\n" "${verbs[$verse-1]} ${actors[$verse-1]}"`)
      ((verse--))
    done

    echo "length: ${#msg}"

    echo "${msg[@]}."

}

#main "$@"
main 7
