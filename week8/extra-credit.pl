#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

my $file = shift || die "Please provide a sequence.\n";
my $seq = "";
my $sc = 0;

open(my $IN, '<', $file);


