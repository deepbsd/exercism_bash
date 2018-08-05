#!/usr/bin/env bash

type=${1}
side1=${2}
side2=${3}
side3=${4}

error(){
  echo "false"
  exit 1
}

( [ ${side1} -eq 0 ] || [ ${side2} -eq 0 ] || [ ${side3} -eq 0 ] ) && error

( [ ((side1+side2)) -le ${side3} ] || [ ((side2+side3)) -le ${side1} ]  || [ ((side1+side3)) -le ${side2} ] ) && error


equilateral(){
  if [ ${1} -eq ${2} ] && [ ${2} -eq ${3} ]; then
    echo true && exit 0
  else
    error
  fi
}


isoceles(){
  if [ ${1} -eq ${2} ] || [ ${2} -eq ${3} ] || [ ${1} -eq ${3} ]; then
    echo true && exit 0
  else
    error
  fi
}


scalene(){
  if [ ${1} -ne ${2} ] && [ ${2} -ne ${3} ] && [ ${1} -ne ${3} ]; then
    echo true && exit 0
  else
    error
  fi
}


case ${type} in
    'equilateral')
        equilateral ${side1} ${side2} ${side3}  ;;
    'isosceles' )
        isoceles ${side1} ${side2} ${side3}  ;;
    'scalene' )
        scalene ${side1} ${side2} ${side3}  ;;
    * )
        echo "not a valid type of triangle"
esac


