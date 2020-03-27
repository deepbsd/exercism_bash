#!/usr/bin/env bash

actors=(
'' 'the house that Jack built'
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
'' 'lay in' 'ate' 'killed' 'worried'
'tossed' 'milked' 'kissed' 'married'
'woke' 'kept' 'belonged to'
        )

main(){

    verse=$1
    msg=()
    while [ $verse -gt 0 ]; do
        echo "verse: ${verse}"
        [ $verse -eq 1 ] && msg=(`echo "This is ${actors[$verse]}"`)
        [ $verse -gt 1 ] && msg+=(`echo "that ${verbs[$verse]} ${actors[$verse]}"`)

        echo "msg: ${msg[@]}"
        ((verse--))
    done

    echo "This is ${msg[@]}"
}

#main "$@"
main 1
