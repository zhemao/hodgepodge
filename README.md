# Hodgepodge Utilities

This is a collection of miscellaneous scripts and utilities that I felt were
too small to get their own repositories but are nonetheless somewhat useful.

The contents of this repository are:

## fixpip.py

This is a workaround to a strange bug in pip, the python package manager, in
which the installation info is stored in a folder called 
(packagename)-(version).egg-info, but the uninstaller expects the folder to be
named (packagename)-(version)-py(pythonversion).egg-info. This script simply
changes all of the names in the installation directory to the correct names.
I am unsure whether the bug is specific to Ubuntu or whether it affects all 
operating systems. Hopefully it is fixed soon.

## eliminate

A simple C program that reads in text, eliminates the whitespace, and then
writes it out. 
The usage is `./eliminate [inputfilename] [outputfilename]`.
If inputfilename is not given, the program will read from standard input.
If outputfilename is not given, the program will write to standard output.
`make eliminate` to compile

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

## fah.sh

A bash initscript for the Linux release of the Folding@Home program. For legal
reasons, I do not redistribute Folding@Home, you must download it yourself.
There are some variables that must be configured in the script. I have left
some comments to tell you how. The commands available in fah are install, 
start, stop, and restart. Install allows you to configure FAH with certain
options. You will want to choose "no" for asking you before downloading work
from the server. Otherwise, FAH won't work in the background. 

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

## mongomigrate.py

A quick and dirty python script to migrate records from one mongodb collection
to another. Usage is `mongomigrate.py [filename]`, where filename is the name
of a configuration json file used by the script. If filename is not provided,
it defaults to "migration.json". The json file should include a dictionary with
two keys: "from" and "to". The values of these should be dictionaries with 
required keys "host", "port", "database", and "collection". There are also
optional keys "username" and "password" if the mongodb instance is running in
protected mode. The "from" dictionary also has an optional key "query" which
is used to select the records to be migrated. If "query" is not provided, all
records in the "from" collection are used. The "migration.json" file in this
repository is a good example.

## webpipe.sh

A shell script that takes HTML from standard input and displays it in your 
webbrowser. In order for this to work, you must set the $BROWSER environmental
variable to your preferred webbrowser.

## pipify.sh

Make any program pipeable. Takes a program that reads input from a file and 
allows it to read from standard input. For instance, to make the vim editor
pipeable, you would do something like `echo "Hello" | ./pipify.sh vim`.

## License

These scripts and programs are made available under the MIT License, 
reproduced in LICENSE

