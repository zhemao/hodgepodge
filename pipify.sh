#!/bin/sh

TMPFILE=/tmp/pipify$$.txt

cat > $TMPFILE

$@ $TMPFILE
