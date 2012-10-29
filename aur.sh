#!/bin/sh

# Where are our executables? Change these only if they are not on the path
MAKEPKG=`which makepkg`
WGET=`which wget`
PACMAN=`which pacman`
TAR=`which tar`
HEAD=`which head`
UNTAR="$TAR xf"

# The base AUR url
BASEURL='https://aur.archlinux.org/packages'

# Download the tarball
fetch () {
    PREFIX=`echo $1 | $HEAD -c 2`
	$WGET "$BASEURL/$PREFIX/$1/$1.tar.gz"
}

# Unpack the tarball
unpack () {
	if ! [ -f "$1.tar.gz" ]; then
		fetch $1
	fi
	$UNTAR "$1.tar.gz"
}

# Build the package
build () {
	if ! [ -d "$1" ]; then
		unpack $1
	fi
	cd "$1"
	if [ -f 'PKGBUILD' ]; then
		$MAKEPKG
	else
		echo "Error: no PKGBUILD found in $1"
	fi
}

# Install the package
install () {
	if ! [ -d "$1" ]; then
		unpack $1
	fi
	cd "$1"
	sudo pacman -U *.pkg.tar.*
}

# Delete the tarball and uncompressed folder
clean () {
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
		
