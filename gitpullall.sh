#!/bin/bash

if [ -z $1 ]; then
	STARTDIR=$PWD
else
	STARTDIR=$1
fi

echo "Pulling all git repositories in $STARTDIR"

SEARCHLIST=`find $STARTDIR`

for dir in $SEARCHLIST; do
	if [ -d $dir/.git ]; then
		cd $dir
		git pull origin master
	fi
done
