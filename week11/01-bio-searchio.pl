#!/usr/bin/env perl
use strict;
use feature 'say';
use File::Basename;
use Bio::SearchIO;

my $blast_report = shift;

my $searchIO_obj = Bio::SearchIO->new(
                                -format => 'blast',
                                -file   => '$blast_report'
                                );

while( $result_obj = $searchIO_obj->next_result ) {
    while( my $hit = $result->next_hit )  {
        while( my $hsp = $hit->next_hsp ) {
            if( $hsp->num_hits >= 1e-50 ) {
                if( $hsp->query_string )  {
                    if( $hsp->evalue )    {
                        if( $hsp->hit_string ) { 
                        print "Query Name=",    $result->query_name,
                             " Hit Name=",      $hit->hit_string,
                             " HSP Evalue=",    $hsp->evalue, "\n";
            }
          }
        }
      }
    }
  }     
}
