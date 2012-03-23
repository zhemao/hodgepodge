#!/usr/bin/env perl

# Extended Zathura
# A script to allow Zathura to view more file types

use strict;
use File::Basename;

my $fname = $ARGV[0];

if(!$fname){
	# no filename provided, so just start zathura normally without arguments
	exec 'zathura';
}

my ($name, $dir, $ext) = fileparse($fname, qr/\.[^.]*/);
my $newfname = "/tmp/$name$ext.pdf";

if( -f $newfname ){
	# if the converted file already exists, use that one
	exec "zathura $newfname";
}

print "$fname $newfname\n";

if($ext eq ".dvi"){
	# latex dvi
	print "Converting dvi\n";
	system "dvipdf $fname $newfname";
} elsif ($ext =~ /\.od[pst]/){
	# Open Document Format
	print "Converting Open Document Format\n";
	system "unoconv $fname $newfname";
} else {
	# if format unrecognized, just execute zathura on unconverted file
	exec "zathura $fname";
}

exec "zathura $newfname";

