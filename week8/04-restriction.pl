#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

my $file = shift || die "Please provide a sequence or file.\n";
my $seq = "";
my $sc = 0;
open(my $IN, '<', $file);

while (my $line = <$IN>)
{
  chomp $line;
  if ($line !~ m/^>/)
  {
    $seq .= $line;
  }
}
close($IN);
$seq =~ s/([AG])(AATT[CT])/$1^$2/g;
print $seq, "\n"
