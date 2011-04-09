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

## eliminate.c

A simple C program that reads from a file or standard input, eliminates 
whitespace characters, and prints to another file or standard output. 
The usage is: eliminate [inputfilename] [outputfilename].
If the input file name is omitted, standard input will be used. If the output
file name is omitted, standard output will be used. To compile the program,
just type gcc eliminate.c -o eliminate, or whatever you want to call the 
executable.

## inserttext.pl

A perl script that inserts the text of one file into a certain line of another 
file.

## sendgmail.py

A python script to send short emails from your gmail account from the command 
line. `./sendgmail.py -m "message"` sends the text in the final argument. 
`./sendgmail.py -f "filename"` sends the text in the file specified by the last
argument.

## asciionly.py

A python script that removes non-ascii characters from a text file in 
preparation for processing by programs written in languages without built-in
unicode support.

These scripts are made available under the MIT License 
(http://www.opensource.org/licenses/mit-license.php)

<copyright holder> Zhehao Mao
<year> 2011
