#!/usr/bin/env perl
use strict;
use warnings;
use autodie; 

my @numbers = @ARGV;

if (@numbers == 0) {
die "Please provide a list of sequence.\n";
}

#my @array;
#my @sorted_array = sort (@array);

#foreach my $number (@numbers) {
#my @sorted_array = sort ( { length($a) <=> length($b) } @array);
#push @array, $number;
#}


#foreach my $number (@numbers) {
#my @sorted_array = sort ( { length($b) <=> length($a) } @array);
#push @array, $number;
#}

print "default sort = ", join (',', (@numbers)), "\n";
print "sorted = ", join (',', sort { length($a) cmp length($b)} (@numbers) ), "\n";
print "reverse = ", join (',', sort { length($b) cmp length($a)} (@numbers) ), "\n";
