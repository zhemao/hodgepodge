#!/bin/sh

LOCALDIR=$1
REMOTEDIR=$2

inotifywait -mr -e close_write -e create -e delete $LOCALDIR | \
	while read dir event file; do
		date +"Synchronized $LOCALDIR at %Y/%m/%d %H:%M:%S"
		rsync -avz --delete $LOCALDIR $REMOTEDIR 
	done
