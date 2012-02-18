#!/bin/sh

PROVIDER=$1
MOBNUM=$2
MSG=$3

case $PROVIDER in
	Verizon)
		SENDTO=$MOBNUM@vtext.com
		;;
	AT\&T)
		SENDTO=$MOBNUM@txt.att.net
		;;
	*)
		echo "Unknown carrier"
		exit 1
		;;
esac

echo $MSG | mail $SENDTO
