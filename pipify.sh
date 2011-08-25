#!/bin/sh

TMPFILE=/tmp/webpipe$$.txt

cat > $TMPFILE

$@ $TMPFILE
