#!/bin/sh

STAT="stat --format=%s"

if [ -z $1 ] || [ -z $2 ]; then
	echo "Usage: $0 file1 file2"
	exit
fi

size1=`$STAT $1`
size2=`$STAT $2`

echo "$size1-$size2" | bc


