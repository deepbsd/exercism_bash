#return word count for each word in a string

input=${1}
declare -A words
ouput=''

for word in $input; do
	[ ${words[$word]} ] && words[$word]=$((${words[$word]}+1))
	[ -z ${words[$word]} ] && words[$word]=$((1))
done

for k in ${!words[@]}; do
	output+="$k: ${words[$k]} "
done

echo $output