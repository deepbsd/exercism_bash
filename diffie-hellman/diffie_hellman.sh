#!/usr/bin/env bash

main(){
    case $1 in
        privateKey ) privateKey $2 ;;
        publicKey ) publicKey $2 $3 $4 ;;
        secret ) secret $2 $3 $4  ;;
        * ) echo "invalid input" && exit 1 ;;
    esac
}

privateKey(){
    FLOOR=1; CEILING=$1; RANGE=$(($CEILING-$FLOOR+1));
    RESULT=$RANDOM; let "RESULT %= $RANGE"; RESULT=$(($RESULT+$FLOOR));
    #echo "i: $1 RESULT: $RESULT"
    (( $RESULT <= $FLOOR )) && RESULT="$(($RESULT+1))"
    (( $RESULT >= $CEILING )) && RESULT="$(($RESULT-1))"
    echo "$RESULT" && exit 0
}

publicKey(){
    echo
}

secret(){
    echo
}

main "$@"
