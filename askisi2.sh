#/bin/bash
par=$1

if [[ $par == ""  ]]
then 
   echo "Den dothike parametros!"
   exit $? 
fi  

Set1=("he" "she" "it" "they")
Set2=("is" "was" "were")
Set3=("a" "to" "the" "there")

path=${XDG_DESKTOP_:-$HOME/Desktop}
gcc word_search.c 

if [[ -d "$path/results" ]]
then  
    echo "Yparxei katalogos Results"
else
    mkdir "$path/results"  
fi 

#i->set1
#j->set2
#k->set3

for i in ${Set1[*]}
do 
  for j in ${Set2[*]}
  do 
    for k in ${Set3[*]} 
    do		
        Title="$path/results/out"_"$i"_"$j"_"$k.txt"
	touch $Title
	./a.out $par $i $j $k>>$Title; 
        
        if (( $? != 0 ))
	then 
	echo "Stopped ,exit with"
	exit $?
	fi

    done 
  done
done


nonempty=0;
counter=0;
counterlines=0;
for f in $path/results/*.txt
do

    if [[ -f $f  ]]
    then
      counter=$((counter+1));
    fi

    if [[ -s $f  ]]
    then
      nonempty=$((nonempty+1));
      currentfile=$(wc -l < "$f")
      counterlines=$(( counterlines+currentfile ))
    fi
done

empty=$(($counter-$nonempty))


echo "Total number of generated files: $counter"
echo "Total number of non-empty files: $nonempty"
echo "Total number of empty files : $empty"
echo "Total number of results (in lines) : $counterlines"
