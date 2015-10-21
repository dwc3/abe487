#!/usr/bin/env perl
use strict;
use warnings;

my $in = shift @ARGV;
my $seq = "";
my $sc = 0;
open(IN,'<',$in) or die "Can't open $in: $!\n";
while( my $line = <IN>)
{
  chomp $line;
  if ($line !~ m/^>/)
  {
    $seq .= $line;
  }
}
close(IN);

print "Original\n";
print "$seq\n";
print "\n\n";

$seq =~ s/([AG])(AATT[CT])/$1\^$2/g;

print "Modified\n";
print $seq,"\n";

print "Fragments\n";
my @fragments = sort {length($b) <=> length($a)} split(/\^/,$seq);
print join("\n",@fragments),"\n";
