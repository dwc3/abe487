#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie; 

my $file = shift || 'Perl_III.nobody.txt';

while (my $line = <>) {
chomp($line);

$line = uc $line;
my $nobody_index = index($line, 'NOBODY');
my $somebody_index = index($line, 'SOMEBODY');
if ($nobody_index >= 0) 
{
warn ("Nobody is here: $nobody_index.\n");
}
if ($somebody_index >= 0) {
warn ("Somebody is here $somebody_index.\n");
}
}
