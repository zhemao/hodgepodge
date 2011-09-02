#!/bin/sh

TMPFILE="/tmp/webpipe$$.html"

cat > $TMPFILE

xdg-open $TMPFILE

