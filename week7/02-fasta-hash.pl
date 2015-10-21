#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use Data::Dumper;
use autodie;

my $file = shift @ARGV || "Perl_V.genesAndSeq.txt";
open my $fh, '<', $file;

my %seqs;
my $id;
while (my $line = <$fh>){
    chomp $line;
    if (substr ($line, 0, 1) eq '>') {
        $id = substr($line, 1);
        $seqs {$id} = 0;
    }else {
        $seqs {$id} += length($line);
    }
}
for my $id ( sort { $seqs{$a} <=> $seqs{$b} } keys %seqs) {
    say "$id: $seqs{$id}";
}
