#!/usr/bin/perl
use strict;
use warnings;
use bigint;
use Math::BigInt;
use Data::Dumper;
#SOLVED
# Find all lychrel numbers below 10,000

my @lychrel = (196, 295, 394, 493, 592, 689, 691, 788, 790, 879, 887, 978, 986, 1495, 1497, 1585, 1587, 1675, 1677, 1765, 1767, 1855, 1857, 1945, 1947, 1997);


my @possible_lychs;
my $ok;
for my $int ( 196..9999 ) {
    $ok = check_for_palindrome($int);
    if ( $ok ) { print $int. " produced a palindrome\n"; }
    elsif ( !$ok ) {
        push @possible_lychs, $int;
    }
}

print "The number of lychrel found : " . scalar(@possible_lychs),"\n";
sub check_for_palindrome {
    my $int   = shift;

    my $num = Math::BigInt->new($int);
    my $count = 0;
    my $sum = Math::BigInt->new;
    my $lych;

    while ( $num ) {
        $sum = $num + reverse($num);
        $count += 1;
        if ( $sum ne reverse($sum) ) {
            $count += 1;
            $num = $sum;
        }
        elsif ( $sum eq reverse($sum) && $count < 50 ) {
                    #push @$lych, { $num => $sum };
                    #last;
            return 1;
        }

        if ( $count >= 50 ) { return; }
    }

}
