#!/usr/bin/env perl
use strict;
use warnings;

my $x = shift;
my $y = shift;

if (! defined($x) or ! defined($y)) {
print "Please provide two numbers.\n";
} elsif (($x + $y) == 0) {
print "You are trying to trick me!\n";
} else {
printf "%0.2f%%\n", 100 * ($x / ($x + $y)), "%\n";
}
