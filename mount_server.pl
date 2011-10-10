#!/usr/bin/env perl

use strict;

my $url=$ARGV[0];

if(!$url){
	die "no url given"
}

if($url =~ /(\w+):\/\/([\w.-@]+)/){
	my $protocol = $1;
	my $location = $2;
	my $user;
	my $retcode;

	if($location =~ /(\w+)@([\w.-]+)/){
		$location = $2;
		$user = $1;
	}

	`mkdir -p ~/.fuse/$location`;

	if( $protocol eq 'ftp' ){
		print("mounting $location to ~/.fuse/$location\n");
		$retcode = system("curlftpfs -o user=$user $location ~/.fuse/$location");
	} elsif ($protocol eq 'ssh'){
		print("mounting $user\@$location to ~/.fuse/$location\n");
		$retcode = system("sshfs $user\@$location: ~/.fuse/$location");
	} elsif ($protocol eq 's3'){
		print("mounting $location to ~/.fuse/$location\n");
		$retcode = system("s3fs $location:/ ~/.fuse/$location");
	}else {
		die("unrecognized protocol.");
	}

	if($retcode == 0){
		system("thunar ~/.fuse/$location");
	}
} else {
	print "Not a valid URL\n";
}
