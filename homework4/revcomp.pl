#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

my $infasta  = shift;
my $outfasta = shift;

if (!defined($infasta) or !defined($outfasta)) {
    die "Usage: revcomp.pl <in.fasta> <out.fasta>\n";
}
else {
    open my $IN,  '<', $infasta;
    open my $OUT, '>', $outfasta;

    my $header;
    my $sequence = '';
    while (my $line = <$IN>) {
        chomp($line);

        if ($line =~ /^>/) {
            if (length($sequence) > 0) {
                print($OUT $header, "reverse-complement\n", $sequence, "\n");
                $sequence = '';
            }
            $header = $line;
        }
        else {
            $line =~ tr/atcgATCG/tagcTAGC/;
            $sequence = reverse($line) . $sequence;
        }
    }
    if (length($sequence) > 0) {
        print($OUT $header, "reverse-complement\n", $sequence, "\n");
    }
    close($OUT);
    close($IN);
}

__END__

Format your code!

autodie/globals

l. 11: Nice usage statement:

 [gila@~/work/students/dwc3/homework4]$ perl revcomp.pl
 Usage: revcomp.pl <in.fasta> <out.fasta>
