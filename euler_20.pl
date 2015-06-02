use strict;
use warnings;
use bigint;
## SOLVED
my $product = 1;
my $num     = 100;

while ( $num > 1 ) {
    --$num;
    $product *= $num;
}

my @split = split m//m, $product;
sum_it(@split);

sub sum_it {
    my $sum;
    map { $sum += $_ } @_;
    return print $sum, "\n";
}

