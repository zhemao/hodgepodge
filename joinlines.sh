#!/bin/bash

curline=""

while read line
do
    if [ -z "$line" ]; then
        echo "$curline"
        echo ""
        curline=""
    elif [ -z "$curline" ]; then
        curline="$line"
    else
        curline="$curline $line"
    fi
done
