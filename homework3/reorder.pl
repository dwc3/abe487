#!/usr/bin/env perl
use strict;
use warnings;

my $name1 = shift;
my $name2 = shift;

if ( !defined($name1) or !defined($name2) ) {
    print "Please provide two names.\n";
}
else {
    if ( ( $name1 cmp $name2 ) > 0 ) {
        print "$name2 $name1\n";
    }
    else {
        print "$name1 $name2\n";
    }
}
