#!/usr/bin/env bash

length_err(){
    echo "slice length cannot be greater than series length"
    return 1
}


main(){
   string=$1
   length=$2
   [ $length -gt ${#string} ] && length_err
   start=0  
   end=$((start+length))
   out_arr=()

   while [ $end -le ${#string} ] ; do
      out_arr+=( "${string:start:length}" )
      ((start++))
      end=$((start+length))
   done

   echo "${out_arr[@]}"
}




main "$@"


#main 1234567 2
