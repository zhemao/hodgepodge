#!/bin/sh

EXECUTABLES="minify sanitize inserttext todec fromdec"

for file in $EXECUTABLES
do
	ln -fs $PWD/$file $HOME/bin/$file
done

for file in *.sh *.py
do
	shortname=`echo $file | sed -e "s/\..*//g"`
	ln -fs $PWD/$file $HOME/bin/$shortname
done
