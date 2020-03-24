#!/usr/bin/env bash





main(){
   string=$1
   length=$2
   start=0  
   end=$((start+length))
   out_arr=()

   while [ $end -le ${#string[@]} ]; do
      echo "${string:$start:$end}"
      out_arr+=( "${string:$start:$end}" )
      ((end++))
      ((start++))
   done

   echo "${out_arr[@]}"
}




#main "$@"


main 1234 2
