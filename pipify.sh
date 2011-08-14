#!/bin/sh

TMPFILE=/tmp/webpipe$RANDOM.txt

cat > $TMPFILE

$@ $TMPFILE
