#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

my %homes = (
    'Tucson'      => 'AZ',
    'Riverside'   => 'CA',
    'Lafayette'   => 'IN',
);
say Dumper(\%homes);

foreach my $city (sort keys %homes) {
    my $aa = $homes{$city};

    print "$city, $aa \n";
}
