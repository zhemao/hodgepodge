#!/bin/sh

gs -dBATCH -dNOPAUSE -q  -sDEVICE=pdfwrite -sOutputFile=/dev/stdout \
    -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen $@
