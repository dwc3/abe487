#!/usr/bin/env perl
use strict;
use warnings;
use autodie; 

my @numbers = @ARGV;

if (@numbers == 0) {
die "Please provide a list of numbers.\n";
}

#my @array;
#my @sorted_array = sort (@array);

#foreach my $number (@numbers) {
#my @sorted_array = sort ( { $a <=> $b } @array);
#push @array, $number;
#}


#foreach my $number (@numbers) {
#my @sorted_array = sort ( { $b <=> $a } @array);
#push @array, $number;
#}

print "default sort = ", join (',', (@numbers)), "\n";
print "numerical sort = ", join (',', sort {$a cmp $b} (@numbers) ), "\n";
print "reverse numerical sort = ", join (',', sort {$b cmp $a} (@numbers) ), "\n";
