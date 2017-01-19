use strict;
use warnings;
use Data::Dumper;

my $c;
my @pvals;
for my $a ( 1..10000 ) {
    for my $b ( 1..10000 ) {
        $c = sqrt( $a**2 + $b**2 );
        if ( $c !~ m/[.]/ ) { # if it isnt a float
            push @pvals, $a + $b + $c;
        }
        last if $a + $b + $c >= 1001;
    }
}

my %count;
for ( @pvals ) {
    $count{$_}++;
}

my @sorted = sort { $count{$b} <=> $count{$a} } keys( %count );
print $sorted[0],"\n";
