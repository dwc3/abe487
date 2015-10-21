#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

say join "\n", sort {length($a) <=> length($b)} split(/\^/, <>);
