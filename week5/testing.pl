#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my @array = (98 2 36 74 27 33);
my @sorted_array = sort (@array);
my @sorted_array = sort (@array);
print @sorted_array,"\n";
@sorted_array = sort ( { $a <=> $b } @array);
print @sorted_array, "\n";
@sorted_array = sort ( { $b <=> $a } @array);
print @sorted_array,"\n";
print "default sort = @sorted_array, "\n";
