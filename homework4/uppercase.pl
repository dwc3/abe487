#!/usr/bin/env perl
use strict;
use warnings;

my $in_file = shift;
my $out_file = shift;
my $infile = "Perl_III.nobody.txt";
my $outfile = "uppercase.out";

open IN, "<", $infile or die "Error writing outfile: $!\n";
open OUT, ">", $outfile or die "Error writing outfile: $!\n";

while (my $line = <IN>) 
{
chomp $line;
my $upper_case_line = uc $line;
print OUT "$upper_case_line\n";
}
