#!/bin/bash

echo "<html>"

if [ -z $1 ]; then
	echo "<body>"
	cat
else
	echo "<head><title>$1</title></head><body>"
	cat $1
fi

echo "</body></html>"
