#!/usr/bin/env perl
use strict;
use warnings;

my $infasta = shift;
my $outfasta = shift;

if (! defined($infasta) or ! defined($outfasta)){
die "Usage: revcomp.pl <in.fasta> <out.fasta>\n";
}
else {
open(IN, '<', $infasta) or die "Cannot open $infasta: $!\n";
open(OUT, '>', $outfasta) or die "Cannot open $outfasta: $!\n";

my $header;
my $sequence = '';
while (my $line = <IN>) {
chomp ($line);

if ($line =~ /^>/) {
if (length($sequence) > 0) {
print (OUT $header, "reverse-complement\n",$sequence,"\n");
$sequence = '';
}
$header = $line;
}
else {
$line =~ tr/atcgATCG/tagcTAGC/;
$sequence = reverse($line).$sequence;
}
}
if (length($sequence) > 0) {
print(OUT $header, "reverse-complement\n",$sequence,"\n");
}
close(OUT);
close(IN);
}
