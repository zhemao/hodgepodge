#!/bin/sh

# Convert Markdown to PDF Format using markdown and htmldoc

if [ -z "$1" ]; then
	echo "Must supply input filename"
else
	if [ -z "$2" ]; then 
		PDFNAME=`echo $1 | sed -e "s/\..*/.pdf/"`
		markdown_py $1 | xhtml2pdf - $PDFNAME
	else
		markdown_py $1 | xhtml2pdf - $2
	fi
fi
