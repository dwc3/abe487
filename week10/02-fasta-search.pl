#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use File::Spec::Functions 'catfile';
use File::Basename 'basename';
use File::Path 'make_path';
use Bio::SeqIO;
use Bio::DB::Fasta;
main();

# --------------------------------------------------
sub main {
    my %opts = get_opts();
    my @args = @ARGV;

    if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
        });
    }   

    my ($file,$pattern) = @ARGV;
    my $db = Bio::DB::Fasta->new($file);
    say "Searching '$file' for '$pattern'";
    my @ids     = grep {/$pattern/} $db->get_all_primary_ids;

    my $count = scalar(@ids);;
    say "Found $count ids.";

   if ($count > 0) {
        (my $filename = $pattern) =~ s/\W//g;
        $filename = '.fa';
        my $writer = Bio::SeqIO->new(-file => ">$filename",
                                     -format => 'Fasta');
        for my $id (@ids) {
        if (my $seq = $db->get_Seq_by_id($id)) {
                $writer->write_seq($seq);
            }
        }
        say "See results in $filename."
    }
}
# --------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'help',
        'man',
        'number:1',
        'ou_dir:s',
    ) or pod2usage(2);

    return %opts;
}
__END__

# --------------------------------------------------

=pod

=head1 NAME

02-fasta-search.pl - a script

=head1 SYNOPSIS

  02-fasta-search.pl file.fa pattern 

Options:

  --help   Show brief help and exit
  --man    Show full documentation

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
