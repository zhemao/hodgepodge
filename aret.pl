#!/usr/bin/env perl

# ARET - Advanced Regular Expression Tool
# Zhehao Mao

use strict;

if(scalar @ARGV < 2){
	print "Usage: apbret.pl action regex [args ...]";
	die;
}

my $action = $ARGV[0];
my $neg = 0;

if(substr($action, 0, 1) eq 'n'){
	$neg = 1;
	$action = substr($action, 1, 1);
}

my $pattern = $ARGV[1];

if($action eq 'c'){
	print count($neg), "\n";
}

if($action eq 'f'){
	print filter($neg);
}

if($action eq 's'){
	print substitute();
}

sub readall{
	my $text;
	while(<STDIN>){
		$text.=$_;
	}
	return $text;
}

sub readlines{
	my @lines;
	while(<STDIN>){
		push @lines, $_;
	}
	return @lines;
}

sub count{
	$neg = $_[0];
	my @lines = readlines();
	
	my $total = 0;
	if($neg){
		foreach (@lines){
			if($_ !~ /$pattern/){ $total += 1; }
		}
	} else {
		foreach (@lines){
			if($_ =~ /$pattern/){ $total += 1; }
		}
	}
	return $total;
}

sub filter{
	$neg = $_[0];
	my @lines = readlines();
	my $retval;

	if($neg){
		foreach (@lines){
			if($_ !~ /$pattern/){
				$retval.=$_;
			}
		}
	} else {
		foreach (@lines){
			if($_ =~ /$pattern/){
				$retval.=$_;
			}
		}
	}	
}

sub substitute{
	my $text = readall();
	my $rep = $ARGV[2];

	$text =~ s/$pattern/$rep/g;

	return $text;
}
