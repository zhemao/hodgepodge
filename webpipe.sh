#!/bin/bash

TMPFILE="/tmp/webpipe$RANDOM.html"

cat > $TMPFILE

$BROWSER $TMPFILE
