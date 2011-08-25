#!/bin/sh

LOCALDIR=$1
REMOTEDIR=$2

rsync -avz --delete $LOCALDIR $REMOTEDIR

EVENTS="CREATE,CLOSE_WRITE,DELETE,MOVED_FROM,MOVED_TO"

inotifywait -mr -e $EVENTS $LOCALDIR | \
	while read dir event file; do
		date +"Received $event at %Y/%m/%d %H:%M:%S"
		if [ $event == "DELETE" ]; then
			rsync -avz --delete $LOCALDIR $REMOTEDIR
		else
			rsync -avz $LOCALDIR/$file $REMOTEDIR/$file 
		fi
	done
