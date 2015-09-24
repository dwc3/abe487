#!/usr/bin/env perl
use strict;
use warnings;

my $infile = 'numbers.txt';
my $outfile = 'myresult.txt';

open (OUTFILE, ">", $outfile);
open (INFILE, "<", $infile);

while (my $number = <INFILE>)
{
chomp $number;

if ($number % 2 ==0 || $number <25){
print $number, "\n";
}
else {
my $factorial = 1; 

while ($number > 0){
$factorial = $factorial * $number;
$number--;
}
print OUTFILE $factorial, "\n";
}
}
close INFILE;
close OUTFILE;
