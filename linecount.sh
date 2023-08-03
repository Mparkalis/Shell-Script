#! /bin/bash


	k=1

	for i in "$@"
	 do

		diadromi=$i
		k=0
		res="$(find "$diadromi" -type f  2> error.txt  > results.txt)" 
		nres="$(cat  results.txt|wc -l)"
		sed 's/ //g' results.txt > results1.txt




	sum=0

	   for j in $nres 
	    do
		fline="$(head  -$j results1.txt)"  
		b="$(cat $fline 2>error.txt |wc -l )" 
		sum=$((sum+b))
            done


	 	echo "$diadromi :  $sum"
		sed 's/.*find:/\/linecount.sh :/g' error.txt >errors.txt
		sed 's/.*cat:/\/linecount.sh :/g' error.txt >errors.txt
		sed 's/No such file or directory/Permision denied/g' errors.txt 

		as=$((as+1))
	done

	if [ $k == 1 ]
	then
         echo "0"
	fi
	if [ $k == 0 ]
	then
         rm error.txt
         rm errors.txt
	 rm results.txt
	 rm results1.txt
	fi


