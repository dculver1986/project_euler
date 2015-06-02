#! /usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
## SOLVED
# amicable numbers

sub sum {
    my $sum;
    map { $sum += $_ } @_;
    return $sum;
}

sub generate_factors {

    my $num = shift;
    my @factors;

    for (my $i = 1; $i<$num; $i++  ) {
        if ( $num % $i == 0 ) {
            push @factors, $i;
        }
    }
    return @factors;
}


my @amicable;

my @first_factors;
my $first_sum;
my @second_factors;
my $second_sum;

for my $int ( 2..9999) { # 1 doesn't count
    @first_factors = generate_factors($int);
    $first_sum = sum(@first_factors);

    @second_factors = generate_factors($first_sum);
    $second_sum = sum(@second_factors);

    if ( grep{ $int == $_ } @amicable ) {
        next;
    }
    no warnings 'uninitialized';
    if ( $int == $second_sum && $second_sum != $first_sum) {
        push @amicable, $int, $first_sum;
        next;
    }

}

my $total = sum(@amicable);
print "FINAL ANSWER: $total\n";

print Dumper(\@amicable);
