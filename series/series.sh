#!/usr/bin/env bash





main(){
   string=$1
   length=$2
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
