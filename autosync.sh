#!/bin/sh

if [ -z $2 ]; then
    echo "Usage: $0 localdir remotedir"
    exit 1
fi

LOCALDIR=$1
REMOTEDIR=$2

rsync -avz --delete $LOCALDIR $REMOTEDIR

EVENTS="CREATE,CLOSE_WRITE,DELETE"

oldtime=`date +%S`

inotifywait -mr -e $EVENTS $LOCALDIR | \
	while read dir event file; do
		time=`date +%S`
		timediff=`echo "$time-$oldtime" | bc`
		if [ $timediff -gt 2 ]; then
			date +"Received $event at %Y/%m/%d %H:%M:%S"
			rsync -avz --delete $LOCALDIR $REMOTEDIR
		fi
		oldtime=time
	done
