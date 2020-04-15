#!/usr/bin/env bash

main(){
    first=$(echo $1 | tr -d "[\[\],]")
    second=$(echo $2 | tr -d "[\[\],]")
    [[ -z $first  || -z $second ]] && echo 'hey' && exit 0

    [[ "${first[@]:0:${#first}-1}" == "${second[@]:0:${#second}-1}" ]] && echo 'hey'
    
}
main "$@"
