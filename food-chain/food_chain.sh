#!/usr/bin/env bash

repeat="I know an old lady who swallowed a"
foods=( null 'fly'  'spider' 'bird' 'cat' 'dog' 'goat' 'cow' 'horse' )
comments=( null "I don't know why she swallowed the fly. Perhaps she'll die." 
    "It wriggled and jiggled and tickled inside her."
    "How absurd to swallow a bird!" "Imagine that, to swallow a cat!"
    "What a hog, to swallow a dog!" "Just opened her throat and swallowed a goat!"
    "I don't know how she swallowed a cow!" "She's dead, of course!" 
)

function bridge(){
    local -i current_verse_num=$1; bridge_string=''
    for ((v=$current_verse_num; v>=2; v--)); do
        bridge_string+="She swallowed the "+${foods[$v]}+" to catch the ${foods[$v-1]}."
        bridge_string=$( echo ${verse_string} | sed 's/"catch the spider.\n"/"catch the spider that wriggled and jiggled and tickled inside her."/g' )
        [[ v -eq 2 ]] && bridge_string+="I don't know why she swallowed the fly. Perhaps she'll die!"
    done

    printf "%s" $bridge_string
}

function say_verse(){
    local -i this_verse=$1
    why=$(bridge $this_verse)
    printf  "%s %s. \n%s \n%s\n" "$repeat" "${foods[$this_verse]}" "${comments[$this_verse]}" "${why}"
}

main(){
    local -i start=$1; local -i end=$2; lyrics=""
    for (( v=$start; v<=$end; v++ )); do
        lyrics+="$( say_verse $v )"
    done
    echo  "$lyrics"
}
main "$@"
