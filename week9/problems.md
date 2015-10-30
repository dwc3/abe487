# Perl VII Problem Set

## Install cpann, local::lib, new-pl

If you have "sudo" privileges (https://xkcd.com/149/), you can install
CPAN (http://cpan.org) modules simply by using the "cpan" or "cpanm" 
commands, e.g.:

    $ sudo cpan -i SQL::Translator
    $ sudo cpanm DBI

When you are on a machine where you do not have "sudo" privileges, 
you will need to install CPAN modules into your $HOME directory.  This 
is easily done with the "CPAN Minus" (AKA "cpanm") program and "local::lib"
which allows you to install modules "local" for yourself.

Here is a good article that covers this topic.

    http://perlmaven.com/install-perl-modules-without-root-rights-on-linux-ubuntu-13-10

Here is how to install the needed programs on the HPC:

    $ curl -L http://cpanmin.us | perl - App::cpanminus
    $ ~/perl5/bin/cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)

Now you need to expand your $PATH to include "~/perl5/bin" and let Perl
know to use the new "local::lib" for modules.  To do this, edit your 
"~/.bashrc" file, e.g.:

    export PATH=$PATH:~/perl5/bin
    eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)

Be sure to source it:

    $ source ~/.bashrc

Now put the "new-pl" script somewhere in your $PATH, e.g.:

    $ cp new-pl ~/perl5/bin

And install the needed Perl modules:

    $ cpanm 
    $ cpanm Env
    $ cpanm IO::Prompt
    $ cpanm Template
    $ cpanm Perl6::Slurp

Now you can install any CPAN modules you need for your projects, e.g.,
if you see an error like "Can't locate autodie.pm in @INC," then do:

    $ cpanm autodie

Create a directory called "week9," and use the "new-pl" script to 
create all the following script, e.g.:

    new-pl 01-subs.pl "subroutine practice"

## 01-subs.pl

Create a subroutine that either prints a "hello" message or the 
reverse complements a sequence.  The first argument is which one
to print and the second is the argument to act upon.

    $ ./01-subs.pl
    Missing program
    Usage:
          01-subs.pl -p hello -a Tucson

          01-subs.pl -p rc -a GAGAGAGAGAGTTTTTTTTT

        Options:

          --program   The thing to do
          --argument  The argument to the thing
          --help      Show brief help and exit
          --man       Show full documentation
    
    $ ./01-subs.pl -h
    Usage:
          01-subs.pl -p hello -a Tucson

          01-subs.pl -p rc -a GAGAGAGAGAGTTTTTTTTT

        Options:

          --program   The thing to do
          --argument  The argument to the thing
          --help      Show brief help and exit
          --man       Show full documentation

    
    $ ./01-subs.pl -p hello
    Missing argument
    Usage:
          01-subs.pl -p hello -a Tucson

          01-subs.pl -p rc -a GAGAGAGAGAGTTTTTTTTT

        Options:

          --program   The thing to do
          --argument  The argument to the thing
          --help      Show brief help and exit
          --man       Show full documentation
    
    $ ./01-subs.pl -a Tucson
    Missing program
    Usage:
          01-subs.pl -p hello -a Tucson

          01-subs.pl -p rc -a GAGAGAGAGAGTTTTTTTTT

        Options:

          --program   The thing to do
          --argument  The argument to the thing
          --help      Show brief help and exit
          --man       Show full documentation

    $ perldoc 01-subs.pl
    NAME
        01-subs.pl - subroutine practice

    SYNOPSIS
          01-subs.pl -p hello -a Tucson

          01-subs.pl -p rc -a GAGAGAGAGAGTTTTTTTTT

        Options:

          --program   The thing to do
          --argument  The argument to the thing
          --help      Show brief help and exit
          --man       Show full documentation

    DESCRIPTION
        Either print "hello <something>" or the reverse-complement of something.

    SEE ALSO
        perl.

    AUTHOR
        Ken Youens-Clark <kyclark@email.arizona.edu>.

    COPYRIGHT
        Copyright (c) 2015 kyclark

        This module is free software; you can redistribute it and/or modify it
        under the terms of the GPL (either version 1, or at your option, any later
        version) or the Artistic License 2.0. Refer to LICENSE for the full
        license text and to DISCLAIMER for additional warranty disclaimers.
    
    $ ./01-subs.pl -p hello -a Tucson
    Hello, Tucson

    $ perl 01-subs.pl -p rc -a GAGAGAGAGAGTTTTTTTTT
    AAAAAAAAACTCTCTCTCTC
