#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

my $pal = shift or die "Please provide a word or phrase.\n";

$pal =~ s/[^A-Za-z0-9]//g;

my $rev = reverse($pal);

if (lc($rev) eq lc($pal)) {
	print "Yes\n";
} else {
	print "No\n";
}
