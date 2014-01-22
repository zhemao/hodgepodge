# Hodgepodge Utilities

This is a collection of miscellaneous scripts and utilities that I felt were
too small to get their own repositories but are nonetheless somewhat useful.

Run `make` to compile all the binaries and `make install` or `install.sh` to
create symlinks to the binaries.

The contents of this repository are:

## minify

A simple C program that reads in text, eliminates the whitespace, and then
writes it out.
The usage is `./minify [inputfilename] [outputfilename]`.
If inputfilename is not given, the program will read from standard input.
If outputfilename is not given, the program will write to standard output.
`make minify` to compile

## inserttext

A C program that inserts the text of one file into a certain line of another 
file. Usage is `./inserttext dest lineno [src]`. If src is not given, text to
be inserted will be taken from standard input. `make inserttext` to compile

## sendgmail.py

A python script to send short emails from your gmail account from the command 
line. `./sendgmail.py -m "message"` sends the text in the final argument. 
`./sendgmail.py -f "filename"` sends the text in the file specified by the last
argument.

## sanitize

A C program that removes non-ascii characters and non-printing characters 
from a text file. Command-line usage is the same as for eliminate. 
`make sanitize` to compile

## aur.sh

A bash script for interacting with the Arch User Repository from the 
command line. The script takes five subcommands: fetch, unpack, build, 
install, and clean. The fetch command downloads the package, unpack
extracts the tarball, build runs makepkg, install runs pacman, and clean
deletes the archive and the uncompressed folder. The fetch, unpack, 
build and install commands are chained. Build and install will run 
unpack if the installation folder doesn't exist. Unpack will run fetch
if the tarball does not exist.

## todec

Takes a number in hexadecimal, octal, or binary, and converts it to decimal.
Usage is `todec [format] [number]`, where format is -x for hex, -o for octal,
or -b for binary (default is hex), and number is the number to convert. If
the number is not given, the number to convert will be taken from standard
input. The converted number is printed to standard output.

## fromdec

The opposite of todec. Converts a decimal number to hex, octal, or binary
format. Usage is the same as todec.

## pdfcat.sh

Use the ghostscript program to concatenate several pdf files together. 
Usage: `pdfcat [file1 file2 file3 ...]`. PDF file is printed to standard 
output.

## webpipe.sh

A shell script that takes HTML from standard input and displays it in your 
default webbrowser.

## pipify.sh

Make any program pipeable. Takes a program that reads input from a file and 
allows it to read from standard input. For instance, to make the vim editor
pipeable, you would do something like `echo "Hello" | ./pipify.sh vim`.

## htmlwrap.sh

Wrap some text in &lt;html&gt; and &lt;body&gt; tags for sending to a browser.
Usage is `htmlwrap.sh [filename]`. If filename is not provided, the script
will read from standard input.

## cmpsize.sh

Compares the size of two files using `stat` and `bc`. Usage is 
`cmpsize file1 file2`.

## lrange

Usage: lrange start end [infile] [outfile]

Reads in the a file and outputs a range of its lines to another file. The 
`start` and `end` arguments mark the range of lines which should be output 
and are inclusive (i.e. lrange 1 2 will output lines 1 and 2). If infile or
outfile are not given, standard input and standard output will be used.

## echorandom

Usage: echorandom arg1 arg2 arg3

Randomly choose one of the arguments and print it to standard output.
Useful if you want to pick a random string in a shell script.

## autosync.sh

Usage: autosync.sh localdir remotedir

Keep a remote directory in sync with a local directory using rsync and inotify.
This script runs rsync when inotify detects a change in your local directory.

## timestamp

Prepends timestamps to each line read from standard input and outputs to
standard output. Useful for logging.

## License

These scripts and programs are made available under the MIT License, 
reproduced in LICENSE

