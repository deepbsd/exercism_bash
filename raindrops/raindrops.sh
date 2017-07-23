#!/usr/bin/env bash



num=$1  # value to test
vals=()
string=""

if [ $1 -lt 2 ] 
	then 
	echo $1 
	exit 0
fi


for (( i=2; i<=$1; i++)); do
	while [ $((num%$i)) == 0 ]; do
		# echo $i
		vals+=(" $i")
		num="$((num/$i))"
	done
done



#echo "VALS: "${vals[@]*5%%}


if echo ${vals[*]} | grep -q '3'; then
	# for i in $(seq 0 ${#vals})
	# do
	# 	if echo ${vals[$i]} | grep -q '5' && [ ${#vals[$i]} -eq 1 ]; then
	# 		string+="Pling";
	# 	fi
	# done
	string+="Pling";
fi
if  echo ${vals[*]} | grep -q '5'; then
	# for i in $(seq 0 ${#vals}) 
	# do
	# 	if echo ${vals[$i]} | grep -q '5' && [ ${#vals[$i]} -eq 1 ]; then
	# 		string+="Plang";
	# 	fi
	# done
	string+="Plang";
fi
if echo ${vals[*]} | grep -q '7'; then

	string+="Plong";
fi



#echo "STRING: "$string

if [  -z "$string"  ]; then
	#echo "changing..."
	string=$1
fi

echo $string


