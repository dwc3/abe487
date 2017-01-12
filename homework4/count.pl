#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use autodie;

my $infile = "PerlIII.fastq";
open my $IN, "<", $infile;

my $number_of_lines = 0;
my $total_length = 0;

while (my $line = <$IN>) {
    #chomp $line;
    $number_of_lines++;
    my $length = length($line);
    my $total_length = $total_length += $length;
}

my $average_length = $total_length / $number_of_lines;

say "Total number of lines =", $number_of_lines;
say "Total length = ",         $total_length;
say "Average line length= ",   $average_length;

__END__

use autodie!

l. 8: Use scalars instead of global filehandles.

l. 14: Chomping removes a character that should be counted.  You
should get the same as "wc":

 [gila@~/work/students/dwc3/homework4]$ perl count.pl
 Total number of lines =121
 Total length = 7800
 Average line length= 64.4628099173554
 [gila@~/work/students/dwc3/homework4]$ wc PerlIII.fastq
      121     150    7921 PerlIII.fastq

After commenting the chomp:

 [gila@~/work/students/dwc3/homework4]$ perl count.pl
 Total number of lines =121
 Total length = 7921
 Average line length= 65.4628099173554

 ll. 22-24: say == less typing
