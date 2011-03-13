#!/usr/bin/python

import os,re

def getrenamelist(path, insert):
    ls = os.listdir(path)
    movelist = []
    for folder in ls:
        m = re.match('^(.*)(\.egg-info)$', folder)
        if m and insert not in folder:
            tup = (folder, m.groups()[0]+insert+m.groups()[1])
            movelist.append(tup)
    return movelist

def moveit(movelist, path):
    for old, new in movelist:
        os.rename(path+old, path+new)

if __name__=='__main__':
    path = '/usr/local/lib/python2.6/dist-packages/'
    movelist = getrenamelist(path, '-py2.6')
    moveit(movelist, path)
