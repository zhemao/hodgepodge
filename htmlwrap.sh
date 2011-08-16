#!/bin/bash

echo "<html>"

if [ -z $1 ]; then
	echo "<title>wrapped.html</title><body>"
	cat
else
	echo $1
	echo "<title>$1</title><body>"
	cat $1
fi

echo "</body></html>"
