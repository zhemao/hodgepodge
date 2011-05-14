# Hodgepodge Utilities

This is a collection of miscellaneous programs and utilities that I felt were
too small to get their own repositories but are nonetheless rather useful.

The contents of this repository are:

## fixpip.py

This is a workaround to a strange bug in pip, the python package manager, in
which the installation info is stored in a folder called 
(packagename)-(version).egg-info, but the uninstaller expects the folder to be
named (packagename)-(version)-py(pythonversion).egg-info. This script simply
changes all of the names in the installation directory to the correct names.
I am unsure whether the bug is specific to Ubuntu or whether it affects all 
operating systems. Hopefully it is fixed soon.

## redis_session.py

A session storage class for web.py that is backed by the redis key value store.
Dependencies are [web.py](http://webpy.org), [redis](http://redis.io), and 
[redis-py](https://github.com/andymccurdy/redis-py)

## eliminate

A simple C program that reads in text, eliminates the whitespace, and then
writes it out. 
The usage is: eliminate [inputfilename] [outputfilename].
If inputfilename is not given, the program will read from standard input.
If outputfilename is not given, the program will write to standard output.
`make eliminate` to compile

## inserttext.pl

A perl script that inserts the text of one file into a certain line of another 
file. Usage is inserttext.pl dest lineno [src]. If src is not given, text to
be inserted will be taken from standard input.

## sendgmail.py

A python script to send short emails from your gmail account from the command 
line. `./sendgmail.py -m "message"` sends the text in the final argument. 
`./sendgmail.py -f "filename"` sends the text in the file specified by the last
argument.

## sanitize

A C program that removes non-ascii characters and non-printing characters 
from a text file. Command-line usage is the same as for eliminate. 
`make sanitize` to compile

## importer.py

Convenient methods for meta-programming around importing modules and objects
in python


## fah

A bash initscript for the Linux release of the Folding@Home program. For legal
reasons, I do not redistribute Folding@Home, you must download it yourself.
There are some variables that must be configured in the script. I have left
some comments to tell you how. The commands available in fah are install, 
start, stop, and restart. Install allows you to configure FAH with certain
options. You will want to choose "no" for asking you before downloading work
from the server. Otherwise, FAH won't work in the background. Also, I suggest
that you do not use Folding@Home on Linux unless you have a multi-core 
computer, because the FAH program takes up all the processing power available
to it for some reason.

## aur.sh

A bash script for interacting with the Arch User Repository from the 
command line. The script takes five subcommands: fetch, unpack, build, 
install, and clean. The fetch command downloads the package, unpack
extracts the tarball, build runs makepkg, install runs pacman, and clean
deletes the archive and the uncompressed folder. The fetch, unpack, 
build and install commands are chained. Build and install will run 
unpack if the installation folder doesn't exist. Unpack will run fetch
if the tarball does not exist.

## License

These scripts and programs are made available under the MIT License, 
reproduced in LICENSE

