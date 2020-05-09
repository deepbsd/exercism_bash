#!/usr/bin/env bash

translate(){
    word=$1
    [[ ${word:0:1} =~ [aeiou] ]] && echo "${word}ay" && return
    [[ ${word:0:3} =~ (squ|thr|sch) ]] && echo "${word:3}${word:0:3}ay" && return
    [[ ${word:0:2} =~ (qu|rh|ch|sh|sk|th) ]] && echo "${word:2}${word:0:2}ay" && return
    [[ ${word:0:2} =~ (yt|xr) ]] && echo "${word}ay" && return
    echo "${word:1}${word:0:1}ay" && return
}

main(){
    [[ "$#" -gt 1 ]] && for ((w=0; w<$#; w++)); do translate $w; done && exit 0
    translate $1
}
main "$@"
