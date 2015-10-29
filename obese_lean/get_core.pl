#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';

@ARGV || die "Please provide input files.\n";

my (%kegg_file, %kegg_reads);
for my $file (@ARGV) {
    open my $fh, '<', $file;

    while (my $line = <$fh>) {
        chomp($line);
        my ($kegg_id, $nmatches) = split(/,/, $line);
        next unless $nmatches >= 50;
        $kegg_file{ $kegg_id }++;
        $kegg_reads{ $kegg_id } += $nmatches;
    }
}

my $nfiles = scalar(@ARGV);

open my $core_fh, '>', 'core';

say $core_fh join "\n", 
    map  { join("\t", $_, $kegg_reads{$_}) }
    grep { $kegg_file{$_} == $nfiles } sort keys %kegg_file;
