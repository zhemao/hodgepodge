#!/bin/sh

# initscript for Folding@Home linux client
# For legal reasons, I cannot distribute the Folding@Home program with this 
# script nor provide a way to download it directly.
# You must download the program from folding.stanford.edu and place it
# in the correct directory.

# Change this to the directory where you downloaded/installed Folding@Home
WORKDIR=$HOME/programs/fah

# Release is the name of the FAH release you will be using
# the following is the 64-bit release
RELEASE=FAH6.34-Linux64.tgz
# Comment the line above and uncomment the line below to use the 32-bit release
#RELEASE=FAH6.02-Linux.tgz

# See Folding@Home documentation for instructions on command line arguments
# This example runs Folding@Home with verbosity level 9
OPTIONS="-verbosity 9"
# This one does the same, but uses two cores
#OPTIONS="-verbosity 9 -smp 2"

# The Folding@Home executable
EXEC="./fah6"

cd $WORKDIR

start_fah () {
	echo "Starting Folding@Home"
	nohup $EXEC $OPTIONS < /dev/null > /dev/null 2>&1 &
	echo $! > fah.pid
}

stop_fah () {
	if [ -f "fah.pid" ]; then
		echo "Stopping Folding@Home"
		kill `cat fah.pid`
		rm fah.pid
	else
		echo "Folding@Home already running."
	fi
}

case $1 in
	install)
		tar xf $RELEASE
		chmod +x $EXEC
		$EXEC -configonly
		;;
	start)
		start_fah
		;;
	stop)
		stop_fah
		;;
	restart)
		stop_fah
		start_fah
		;;
	log)
		tail FAHlog.txt
		;;
	*)
		echo "Usage: $0 {install|start|stop|restart}"
esac

