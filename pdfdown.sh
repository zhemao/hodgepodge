#!/bin/sh

# Convert Markdown to PDF Format using markdown and htmldoc

if [ -z "$2" ]; then
	markdown | htmldoc - --format pdf14
else
	if [ -z "$2" ]; then 
		markdown $1 | htmldoc - --format pdf14
	else
		markdown $1 | htmldoc - --format pdf14 > $2
	fi
fi
