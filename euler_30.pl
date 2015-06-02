#! /usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
###
### SOLVED
###
my @split_num;
my $total;
my @digit_fifths;
for my $num ( 2..1000000 ) { # I know there are none less than 4000
    @split_num = split //, $num;

    $total = 0;
    for my $int ( @split_num) {
        $total += $int**5;
    }
    if ( $total == $num ) {
        print $total. " is a fifth power sum number\n";
        push @digit_fifths, $num;
    }

}
print Dumper(\@digit_fifths);

my $sum;
map { $sum += $_ } @digit_fifths;
print $sum,"\n";


