#!/usr/bin/env perl

use strict;
use warnings;

@ARGV or die 'No input';

while (my $line = <>) {
    chomp($line);

    $line = uc $line;
    my $nobody_index   = index($line, 'NOBODY');
    my $somebody_index = index($line, 'SOMEBODY');

    if ($nobody_index >= 0) {
        warn("Nobody is here: $nobody_index.\n");
    }

    if ($somebody_index >= 0) {
        warn("Somebody is here $somebody_index.\n");
    }
}

__END__

Format your code!

You never check that there is an argument, so you read from 
STDIN and that just hangs with no direction to the user as to
what to do.
