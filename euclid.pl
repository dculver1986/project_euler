#!/usr/bin/perl

use strict;
use warnings;

=ignore

Euclid's algorithm for finding greatest common factor of 2 numbers

=cut


my $m = 544;
my $n = 119;

my $remainder;
for ( 1..$n ) {
    $remainder = divide($m, $n);
    if ( $remainder == 0 ) {
        print $n,"\n";
        last;
    }
    else {
        $m = $n;
        $n = $remainder;
    }
}

sub divide {

    my $m = shift;
    my $n = shift;

    my $remainder = $m % $n;
    return $remainder;
}
