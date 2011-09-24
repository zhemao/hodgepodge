#!/usr/bin/env perl

use strict;

my $url=$ARGV[0];

if(!$url){
	die "no url given"
}

if($url =~ /(\w+):\/\/(\w+)@([\w.-]+)/){
	my $protocol = $1;
	my $user = $2;
	my $location = $3;
	my $retcode;

	if( $protocol eq 'ftp' ){
		$retcode = system("curlftpfs -o user=$user $location ~/.fuse/$location");
	} elsif ($protocol eq 'ssh'){
		$retcode = system("sshfs $user\@$location: ~/.fuse/$location");
	} else {
		die("unrecognized protocol.");
	}

	if($retcode == 0){
		system("thunar ~/.fuse/$location");
	}
} else {
	print "Not a valid URL\n";
}
