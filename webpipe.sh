#!/bin/sh

TMPFILE="/tmp/webpipe$$.html"

cat > $TMPFILE

if [ -z $BROWSER ]; then
	echo "The \$BROWSER variable has not been set"
else
	$BROWSER $TMPFILE
fi
