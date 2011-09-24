#!/bin/sh

EXECUTABLES="minify sanitize inserttext todec fromdec"

for file in $EXECUTABLES
do
	ln -fs $PWD/$file $HOME/bin/$file
done

for file in *.sh *.py *.pl
do
	if [ $file != "install.sh" ]; then
		shortname=`echo $file | sed -e "s/\..*//g"`
		ln -fs $PWD/$file $HOME/bin/$shortname
	fi
done

if [ ! -d ~/.fuse ]; then
	mkdir ~/.fuse
fi
