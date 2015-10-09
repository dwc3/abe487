#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

my ($s1, $s2) = @ARGV;

if (@ARGV !=2) {
die "Please provide two sequence. \n";
}

if (length($s1) != length($s2)){
die "Please ensure the sequences are the same length.\n";
}

my $count = 0;

for (my $i = 0; $i < length($s1); $i++) {
my $n1 = substr($s1, $i, 1);
my $n2 = substr($s1, $i, 1);

# print "i ($i), s1 ($n1), s2 ($n2)\n";

if ($s1 ne $s2) {
print "Pos ", $i+1, ": ", $n1, " => ", $n2, "\n";
$count++;
}
}

printf "Found %s SNP%S.\n", $count, ($count == 1) ? ' ' : 's';
