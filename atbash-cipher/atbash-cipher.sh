# atbash cipher example

input=${1}

output=`echo $input | tr '[:upper:]' '[:lower:]' | tr '[abcdefghijklmnopqrstuvwxyz]' '[zyxwvutsrqponmlkjihgfedcba]' `

echo $output