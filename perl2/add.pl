#!/usr/bin/perl
use strict;
use warnings;

my $x = shift;
my $y = shift;

if (! defined($x) or ! defined($y)) {
print "Please provide two positive numbers.\n";
} elsif ($x < 0 or $y <0) {
} else {
print $x + $y, "\n";
}
