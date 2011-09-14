#!/bin/sh

if [ -z $1 ]; then
	echo "must supply server name"
	exit
fi

fusermount -u ~/.fuse/$1
rmdir ~/.fuse/$1
