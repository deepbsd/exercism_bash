#!/usr/bin/env bash

word=`echo ${1} | tr [:upper:] [:lower:]`

#characters=( $(echo ${word} | sed 's/\(.\)/\1 /g') )
characters=( s i l v e r )

sum=0

ones=( a i e o u l n r s t )
twos=('d' 'g')
threes=('b' 'c' 'm' 'p')
fours=('f' 'h' 'v' 'w' 'y')
fives=('k')
eights=('j' 'x')
tens=('q' 'z')

for char in ${characters[@]}; do
    case $char in 

        $(echo ${ones[@]} | grep ${char}) )
            ((sum+=1))  ;;
        $(echo ${twos[@]} | grep ${char} ))
            ((sum+=2))  ;;
        $(echo ${threes[@]} | grep ${char} ))
            ((sum+=3))  ;;
        $(echo ${fours[@]} | grep ${char} ))
            ((sum+=4))  ;;
        $(echo ${fives[@]} | grep ${char} ))
            ((sum+=5))  ;;
        $(echo ${eights[@]} | grep ${char} ))
            ((sum+=8))  ;;
        $(echo ${eights[@]} | grep ${char} ))
            ((sum+=8))  ;;
    esac
done


print "SUM: ${sum}" || exit 1

exit 0
