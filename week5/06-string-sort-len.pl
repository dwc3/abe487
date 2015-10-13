#!/usr/bin/env perl
use strict;
use warnings;
use autodie; 

my @numbers = @ARGV;

if ( @numbers == 0 ) {
    die "Please provide a list of sequence.\n";
}

print "default sort = ", join( ',', (@numbers) ), "\n";
print "sorted = ", join( ',', sort { length($a) cmp length($b) } (@numbers) ),
  "\n";
print "reverse = ", join( ',', sort { length($b) cmp length($a) } (@numbers) ),
  "\n";
