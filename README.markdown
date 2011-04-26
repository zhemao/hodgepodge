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

## aret.pl

ARET stands for Advanced Regular Expression Tool. It's a perl script which 
makes it easier to do common things with regular expressions. It's basic
usage is aret.pl action regex [extra]. Action can be one of the following.

* c - count the lines in standard input which match the regular expression and
print the result to standard output
* f - filter standard input, outputting to standard output only the lines that 
match the regular expression (this is basically just grep).
* s - substitute all matches of regex in standard input with extra and print to
standard output

You can also add the character n in the action and aret will do the opposite of
everything. That is, nc will count the lines not matching regex, and nf will
print out the lines not matching regex. This does not work with substitution. 

These scripts are made available under the MIT License 
(http://www.opensource.org/licenses/mit-license.php)

<copyright holder> Zhehao Mao
<year> 2011
