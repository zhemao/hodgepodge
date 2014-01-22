#!/bin/sh

EXECUTABLES="minify sanitize inserttext todec fromdec lrange timestamp \
	echorandom xmarquee randomdig"

PYTHON=/usr/bin/python2

echo "Installing executables"

for file in $EXECUTABLES
do
    cp $PWD/$file $HOME/bin/$file
done

echo "Installing shell and perl scripts"

for file in *.sh
do
	if [ $file != "install.sh" ]; then
		shortname=`echo $file | sed -e "s/\..*//"`
        cp $PWD/$file $HOME/bin/$shortname
	fi
done

echo "Installing python scripts"

for file in *.py
do
	shortname=`echo $file | sed -e "s/\..*//"`
	rm -f $HOME/bin/$shortname
	echo "#!$PYTHON" > $HOME/bin/$shortname
	cat $file >> $HOME/bin/$shortname
	chmod +x $HOME/bin/$shortname
done

if [ ! -d ~/.fuse ]; then
	mkdir ~/.fuse
fi
