#!usr/bin/env perl
use strict;
use warnings;

my $first = shift;
my $second = shift;

my $error = "divide_error.txt";
my $divisor_out = 'divide_out.txt';
open (OUTFILE, '>', $divisor_out) || die "Can't write to outfile: $!\n";
open (STDERR, '>', $error) || die "Can't write to error: $!\n";

if(not defined $first)
{
print "Please provide two numbers\n";
}

elsif(not defined $second)
{
print "Please provide two  numbers\n";
}

elsif($second == 0)
{
print "Please do not include 0 as your second number\n";
}
if(defined $first && defined $second)
{
if($first > 0 && $second > 0)
{
my $divisor = $first / $second;
print OUTFILE $divisor,"\n";
}
else 
{
print STDERR "Numbers cannot be negative!.\n";
}
}
