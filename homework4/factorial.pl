#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

my $infile  = 'numbers.txt';
my $outfile = 'myresult.txt';

open my $OUTFILE, ">", $outfile;
open my $INFILE,  "<", $infile;

while (my $number = <$INFILE>) {
    chomp $number;

    if ($number % 2 == 0 || $number < 25) {
        print $number, "\n";
    }
    else {
        my $factorial = 1;

        while ($number > 0) {
            $factorial *= $number;
            $number--;
        }
        print $OUTFILE $factorial, "\n";
    }
}
close $INFILE;
close $OUTFILE;

__END__

autodie/no globals

l. 16: You "OR" isn't quite right as it lets numbers greater 
than 24 through:

 [gila@~/work/students/dwc3/homework4]$ perl factorial.pl
 22
 1
 2
 32
 72
 24

One point off.
