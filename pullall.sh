#!/bin/bash

if [ -z $1 ]; then
	STARTDIR=$PWD
else
	STARTDIR=$1
fi

echo "Pulling all git repositories in $STARTDIR"

SEARCHLIST=`find $STARTDIR`

for dir in $SEARCHLIST; do
	if [ -d $dir ]; then
		cd $dir
		if [ -d $dir/.git ]; then
			git pull origin master
		else
			if [ -d $dir/.hg ]; then
				hg pull -u
			fi
		fi
	fi
done
