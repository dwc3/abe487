#!/usr/bin/env perl
use strict;
use warnings


my $al_seq1 = "ATGTCC---GT-GGCC"; # Aligned sequence 1
my $al_seq2 = "--CTCCATCGTT-GCC"; # Aligned sequence 2
my $size = length($al_seq1);

my @seq1 = split(//,$al_seq1);
my @seq2 = split(//,$al_seq2);

print "$al_seq1\n";
print "$al_seq2\n";
for(my $c = 0; $c < $size; $c++)
{
  if ($seq1[$c] ne $seq2[$c])
  {
    print "Difference at $c\n";
  }
}

