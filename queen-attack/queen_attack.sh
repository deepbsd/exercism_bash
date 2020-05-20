#!/usr/bin/env bash

main(){
    white=$2; black=$4
    w_row=${white:0:1}; w_col=${white:2:1}
    b_row=${black:0:1}; b_col=${black:2:1}
    echo "white: ${white} black: ${black} "
    echo "w_row: ${w_row} w_col: ${w_col} "
}
main "$@"
