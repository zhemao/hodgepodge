#!/bin/bash

if [ -z $1 ]; then
	STARTDIR=$PWD
else
	STARTDIR=$1
fi

echo "Pulling all repositories in $STARTDIR"

SEARCHLIST=`find $STARTDIR -name .git -or -name .hg`

for repodir in $SEARCHLIST; do
	dir=`dirname $repodir`
	echo "Pulling $dir"
	cd $dir
	if [ -d "$dir/.git" ]; then
		git pull origin master 
	else
		if [ -d "$dir/.hg" ]; then
			hg pull -u
		fi
	fi
done
