#!/bin/sh

# Convert Markdown to PDF Format using markdown and htmldoc

if [ -z "$1" ]; then
	echo "Must supply input filename"
else
	PDFNAME=`echo $1 | sed -e "s/\..*/.pdf/"`
	markdown_py $@ | xhtml2pdf - $PDFNAME
fi
