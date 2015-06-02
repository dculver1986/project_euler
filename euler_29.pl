use strict;
use warnings;
use bigint;
use Data::Dumper;
## SOLVED
#
my @distinct;
my $product;

for my $int ( 2..100 ) {
    for my $rad ( 2..100 ) {
        $product = $int**$rad;
        if ( !(grep { $_ == $product } @distinct) ) {
            push @distinct, $product;
        }
    }
}
my @sorted = sort { $a <=> $b } @distinct;
print scalar(@sorted);
