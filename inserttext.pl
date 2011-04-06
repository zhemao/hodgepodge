#!/usr/bin/env perl

use strict;

if(scalar @ARGV == 0){
    print "Usage: inserttext.pl dest src linenum\n";
}

# line counter starts at 1
my $x=1;
# open each file for reading
open(FILE1, $ARGV[0]);
open(FILE2, $ARGV[1]);

# init some shit
my $str = "";
my($f1line, $f2line);

# start reading file1 line by line and appending to $str
while($f1line = <FILE1>){
    # if the line number has been reached, start appending from FILE2
    if($x == $ARGV[2]){
	while($f2line = <FILE2>){
	    $str.=$f2line;
	}
    }
    $str.=$f1line;
    $x++;
}

# open file1 for writing and write the combined text to the file
open(FILE1, ">$ARGV[0]");

print FILE1 $str;
