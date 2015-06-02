#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;


my @fibs = get_n_fib(7);
print Dumper(@fibs);

sub get_n_fib {

    my $n = shift;
    my @fibo = (1, 1);

    for my $f (@fibo) {
         push @fibo, $fibo[-1] + $fibo[-2];

        if ( scalar(@fibo) == $n ) {
            last;
        }

    }

    return \@fibo;
}
