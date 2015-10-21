#!/usr/bin/env perl
use strict;
use warnings;

my $file = shift @ARGV;
open (IN, '<', $file) or die "Can\'t open $file: $!\n";
while (my $line = <IN>)
{
  chomp $line;
  if($line -~ m/^>/)
  {
     $line =~ m/(.+?) (.+)/;
     print "id: $1 desc: $2\n";
  }
}
close(IN);
