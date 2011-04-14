#!/usr/bin/env python

import sys

def strip_nonascii(fname):
    f = open(fname, 'r')
    instr = f.read()
    f.close()
    outstr = ''
    for c in instr:
        if ord(c)<128:
            outstr+=c
    f = open(fname, 'w')
    f.write(outstr)


if __name__=='__main__':
    if(len(sys.argv)==1):
        print("Usage: asciionly.py <filename1> [filename2 filename3 ...]")
    else:
        for fname in sys.argv[1:]:
            strip_nonascii(fname)
    
