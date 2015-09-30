#!/usr/bin/env perl
use strict;
use warnings;

my $in_file = shift;
my $out_file = shift;
my $infile = "jabberwocky.txt";
my $outfile = "uppercase.out";
 
open IN, "<", $infile or die "Error Writing outfile: $!\n";
open OUT, ">", $outfile or die "Error Writing outfile: $!\n";

while (my $line = <IN>)
{
chomp $line;
my $upper_case_line = uc $line;
print OUT "$upper_case_line\n";
}
