#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

my @numbers = @ARGV;

if ( @numbers == 0 ) {
    die "Please provide a list of sequence.\n";
}

print "sorted = ",  join( ',', sort { $a cmp $b } (@numbers) ), "\n";
print "reverse = ", join( ',', sort { $b cmp $b } (@numbers) ), "\n";
