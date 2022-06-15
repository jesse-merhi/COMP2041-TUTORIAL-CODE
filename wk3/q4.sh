#! /usr/bin/env sh

case $# in
	1)
	FIRST=1
	INCREMENT=1
	LAST=$1
;;
	2)
	FIRST=$1
	INCREMENT=1
	LAST=$2
;;
	3)
	FIRST=$1
	INCREMENT=$2
	LAST=$3
;;
	*)
	echo "usage: $0 [FIRST [INCREMENT]] LAST" >& 2
	exit
esac

if [ "$FIRST" -eq "$FIRST" ] 2> /dev/null 
then
	:
else
	echo "$0: Error <FIRST> must be an integer." >& 2
	exit
fi

CURRENT="$FIRST"
while [ "$CURRENT" -le "$LAST" ] 
do
	echo "$CURRENT"
	CURRENT=$(( CURRENT + INCREMENT ))
done

