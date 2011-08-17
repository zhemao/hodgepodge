#!/bin/sh

EXECUTABLES="minify sanitize inserttext todec fromdec"

for file in $EXECUTABLES
do
	ln -fs $PWD/$file $HOME/bin/$file
done

shopt -s extglob

for file in !(install).sh *.py
do
	shortname=`echo $file | sed -e "s/\..*//g"`
	echo $shortname
	ln -fs $PWD/$file $HOME/bin/$shortname
done
