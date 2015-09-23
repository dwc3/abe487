#!/usr/bin/env perl
use strict;
use warnings;

my $string1 = shift;
my $string2 = shift;

if ( !defined($string1) or !defined($string2) ) {
    print "Please provide two strings to compare.\n";
}
elsif ( $string1 eq $string2 ) {
    print "same\n";
}
else {
    print "different\n";
}
