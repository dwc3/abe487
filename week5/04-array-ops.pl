#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

my @array = (101, 2, 15, 22, 95, 33, 2, 27, 72, 15, 52);
print "array = ";
print join (',', @array),"\n";

my $number = pop (@array);
print "popped = $number";
print ", array = ";
print join(',', @array), "\n";

my $first = shift(@array);
print "shifted = $first";
print ", array = ";
print join(',', @array),"\n";

push(@array, "12");
print "afterpush, array = ";
print join(',', @array),"\n";

unshift(@array, '4');
print "after unshift, array = ";
print join(',', @array),"\n";
