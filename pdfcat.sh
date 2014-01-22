#!/bin/sh

if [ -z $1 ]; then
    echo "Usage: $0 file1.pdf [file2.pdf ...]"
    exit 1
fi

gs -dBATCH -dNOPAUSE -q  -sDEVICE=pdfwrite -sOutputFile=/dev/stdout \
    -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen $@
