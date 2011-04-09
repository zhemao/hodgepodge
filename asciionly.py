#!/usr/bin/python3

import sys

if __name__=='__main__':
    f = open(sys.argv[1], 'r')
    instr = f.read()
    f.close()
    outstr = ''
    for c in instr:
        if ord(c)<128:
            outstr+=c
    f = open(sys.argv[1], 'w')
    f.write(outstr)
