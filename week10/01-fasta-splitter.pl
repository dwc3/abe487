#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Cwd 'cwd';
use File::Spec::Functions 'catfile';
use File::Basename 'basename';
use File::Path 'make_path'; 
use Bio::SeqIO;
main();

# --------------------------------------------------
sub main {
    my @args = @ARGV or pod2usage();
    my $seq;
    my %opts = get_opts ();

    if ($opts{'help'} || $opts{'man'}){
        pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
        })
    }

    @ARGV or pod2usage("Provide a FASTA file");
 
    my $max     = $opts{'number'} || 500;
    my $out_dir = $opts{'out_dir'} || cwd ();
    
    for my $file (@ARGV) {
        say "file ($file)";
        my $in = Bio::SeqIO->new(-file => $file,
                                 -format => "fasta");
        
        my $count = 0; 
        my $filenum = 1;
        my $out = new Bio::SeqIO(-file=> ">$file.$filenum", -format=>'fasta');
        while (my $seq = $in->next_seq()) {
            $count++;
            if ($count > $max) {
                $count = 1;
                $filenum++;
                $out = new Bio::SeqIO(-file=> ">$out", -format =>'fasta');
                $out->write_seq($seq);
            }

            $out->write_seq($seq);
        }
    }

    say "Done.";
}

# --------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'number:i',
        'out_dir:s',
        'help',
        'man',
    ) or pod2usage(2);

    return %opts;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

01-fasta-splitter.pl - a script

=head1 SYNOPSIS

  01-fasta-splitter.pl -n 20 -o ~/split file1.fa [file2.fa ...]

Options (defaults in parentheses):


  --number  The maxmimum number of sequences per file (500)
  --out_dir Output directory (cwd)
  --help    Show brief help and exit
  --man     Show full documentation

=head1 DESCRIPTION

Describe what the script does, what input it expects, what output it
creates, etc.

=head1 SEE ALSO

perl.

=head1 AUTHOR

Denisse Watt Cuarteros E<lt>dwc3@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 dwc3

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut
