#!/bin/bash

if [ ! -f MDSS.py ]; then
	echo "Cannot find MDSS.py"
	exit 1
fi

integrex='^[0-9]+$'
if ! [[ $1 =~ $integrex ]] ; then
	echo "All arguments must be integers"
	exit 1
elif ! [[ $2 =~ $integrex ]] ; then
        echo "All arguments must be integers"
        exit 1
elif ! [[ $3 =~ $integrex ]] ; then
        echo "All arguments must be integers"
        exit 1
elif ! [[ $4 =~ $integrex ]] ; then
        echo "All arguments must be integers"
        exit 1

elif [ $1 -ge 500 ] && [ $1 -le 2000 ] && [ $2 -ge 500 ] && [ $2 -le 2000 ] && [ $3 -ge 100 ] && [ $3 -le 1100 ] && [ $4 -ge 100 ] && [ $4 -le 1100 ] ; then
	
	temp=$1
	dens=$3
	while [ $temp -le $2 ]
	do
		while [ $dens -le $4 ]
		do
		# echo "temp $temp dens $dens"
		MDSS.py $temp $dens | grep pressure
		let dens+=100
		done
	let dens=$3
	let temp+=100
	done

else
echo "Parameters not in range"
fi
