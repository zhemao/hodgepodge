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
Dependencies are web.py (http://webpy.org), redis (http://redis.io), and 
redis-py (https://github.com/andymccurdy/redis-py)

## eliminate

A simple C program that reads from a file or standard input, eliminates 
whitespace characters, and prints to the same or another file. 
The usage is: eliminate [inputfilename] [outputfilename].
If inputfilename is not given, the program will read from standard input.
If the outputfilename is not given, the program will write to standard output.
`make eliminate` to compile

## inserttext.pl

A perl script that inserts the text of one file into a certain line of another 
file.

## sendgmail.py

A python script to send short emails from your gmail account from the command 
line. `./sendgmail.py -m "message"` sends the text in the final argument. 
`./sendgmail.py -f "filename"` sends the text in the file specified by the last
argument.

## sanitize

A C program that removes non-ascii characters and non-printing characters other than 
\t, \r, and \n from a text file. Command-line usage is the same as for eliminate.

## importer.py

Convenient methods for meta-programming around importing modules and objects
in python

These scripts are made available under the MIT License 
(http://www.opensource.org/licenses/mit-license.php)

<copyright holder> Zhehao Mao
<year> 2011
