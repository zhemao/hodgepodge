#!/bin/bash

# A script to find music files in a folder and play them at random 
# using mplayer

if [ -z "$1" ]; then
	if [ -z "$MUSIC_FOLDER" ]; then
		MUSIC_FOLDER="$HOME/Music"
	fi
else
	MUSIC_FOLDER=$1
fi

if [ -z "$MUSIC_PLAYER" ]; then
	MUSIC_PLAYER='mplayer'
fi

if [ -d $MUSIC_FOLDER ]; then
	music_list='/tmp/music_list.txt'
	find $MUSIC_FOLDER -name \*.mp3 -or -name \*.ogg \
		-or -name \*.wav -or -name \*.flac > $music_list
	numfiles=`wc -l < $music_list`
	while [ "$?" == "0" ]; do
		lineno=`echo "$RANDOM % $numfiles" | bc`
		echo $lineno
		file="`lrange $lineno $lineno $music_list`"
		$MUSIC_PLAYER "$file"
	done
fi
