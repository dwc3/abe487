#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';

my $in = shift || die "Please provide a FASTA file.\n";

open my $fh, '<', $in;

my $count;
while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /^>(.+)/) {
        $count++;
        say "$count: $1";
    }
}

if ($count > 1) {
    say "Found $count sequences.";
} else {
    say "Found $count sequence.";
}
