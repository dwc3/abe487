#!/usr/bin/env perl
use strict;
use warnings;

sub revcompl {
  my (@dna) = @_;
  foreach my $segment (@dna) {
    my $revcomp = reverse($segment);
    $revcomp =~ tr/ACGTacgt/TGCAtgca/;
    return $recomp;
    }
}
