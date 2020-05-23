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
    FLOOR=2; CEILING=$(($1-1)); RANGE=$(($CEILING-$FLOOR+1));
    RESULT=$RANDOM; let "RESULT %= $RANGE"; RESULT=$(($RESULT+$FLOOR));
    echo "$RESULT" && exit 0
}

publicKey(){
    public_key=$(( (( $2**$3 )) % $1 ))
    echo "$public_key" && exit 0
}

secret(){
    echo
}

main "$@"
