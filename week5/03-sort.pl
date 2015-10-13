#!/usr/bin/env perl
use strict;
use warnings;
use autodie; 

my @numbers = @ARGV;

if ( @numbers == 0 ) {
    die "Please provide a list of numbers.\n";
}
print "default sort = ", join( ',', (@numbers) ), "\n";
print "numerical sort = ", join( ',', sort { $a <=> $b } (@numbers) ), "\n";
print "reverse numerical sort = ", join( ',', sort { $b <=> $a } (@numbers) ),
  "\n";

__END__

cmp is for strings
<=> is for numbers
