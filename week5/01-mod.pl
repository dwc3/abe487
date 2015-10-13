#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my @numbers = @ARGV;

if ( @numbers == 0 ) {
    die "Please provide a list of numbers.\n";
}

my @evens;
foreach my $number (@numbers) {
    if ( $number % 2 == 0 ) {
        push @evens, $number;
    }
}

print "evens = ", join( ', ', @evens ), "\n";
