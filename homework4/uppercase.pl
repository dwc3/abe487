#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

my $in_file  = shift;
my $out_file = shift;
my $infile   = "Perl_III.nobody.txt";
my $outfile  = "uppercase.out";

open my $IN,  "<", $infile  or die "Error writing outfile: $!\n";
open my $OUT, ">", $outfile or die "Error writing outfile: $!\n";

while (my $line = <$IN>) {
    my $upper_case_line = uc $line;
    print $OUT "$upper_case_line";
}

__END__

Format your code!

autodie/globals

Don't chomp if you're going to print the newline.
