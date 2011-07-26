#!/bin/sh

# Where should packages be downloaded? 
DOWNLOADDIR="$HOME/Downloads"

# Where are our executables? Change these only if they are not on the path
MAKEPKG=`which makepkg`
WGET=`which wget`
PACMAN=`which pacman`
TAR=`which tar`
UNTAR="$TAR xf"

# The base AUR url
BASEURL='https://aur.archlinux.org/packages'

# Download the tarball
fetch () {
	cd $DOWNLOADDIR
	$WGET "$BASEURL/$1/$1.tar.gz"
}

# Unpack the tarball
unpack () {
	cd $DOWNLOADDIR
	if ! [ -f "$1.tar.gz" ]; then
		fetch $1
	fi
	$UNTAR "$1.tar.gz"
}

# Build the package
build () {
	if ! [ -d "$DOWNLOADDIR/$1" ]; then
		unpack $1
	fi
	cd "$DOWNLOADDIR/$1"
	if [ -f 'PKGBUILD' ]; then
		$MAKEPKG
	else
		echo "Error: no PKGBUILD found in $DOWNLOADDIR/$1"
	fi
}

# Install the package
install () {
	if ! [ -d "$DOWNLOADDIR/$1" ]; then
		unpack $1
	fi
	cd "$DOWNLOADDIR/$1"
	if [ `id -ur` -eq 0 ]; then
		sudo pacman -U *.pkg.tar.*
	else
		echo 'Error: you must be root to do this'
	fi
}

# Delete the tarball and uncompressed folder
clean () {
	cd $DOWNLOADDIR
	rm -rf $1
	rm "$1.tar.gz"
}

case $1 in 
fetch) fetch $2;;
unpack) unpack $2;;
build) build $2;;
install) install $2;;
clean) clean $2;;
*) echo "Usage: $0 {fetch|unpack|build|install|clear} package"
esac
		
