#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

my $pal = shift;

if (! defined ($pal)) {
   print "Please provide a word or phrase.\n";
}
else
{  $pal =~ s/[^A-Za-z0-9]//g;

   my $rev = reverse($pal);
   if (lc($rev) eq lc($pal)) {
       print "Yes\n";
  
   } else {
       print "No\n";
   }
}
