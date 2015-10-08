#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my @array;
  my $sequence =  shift ( @array);
  my @sequence = split (//, $sequence);
  my $total_length = 0;
  my $GC_count = 0;

foreach my $nucl (@sequence){
  if ( ($nucl eq "C") or ( $nucl eq "G") ){
        $GC_count++;
      }
     $total_length++
   }
   print $total_length,"\n";
   my $percent_GC = ($GC_count/$total_length)*100;
   print $percent_GC,"\n";
