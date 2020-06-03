#!/usr/bin/env bash

main(){
    input="$1"
    readarray -t outarr <<<"$input"

    for line in "${outarr[@]}"; do
        echo "line: $line"
    done
}

main "$@"
