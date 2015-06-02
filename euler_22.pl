use strict;
use warnings;
use Data::Dumper;

## SOLVED

# Euler problem 22
#For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
#What is the total of all the name scores in the file?


our %alphabet = (
    a => 1,
    b => 2,
    c => 3,
    d => 4,
    e => 5,
    f => 6,
    g => 7,
    h => 8,
    i => 9,
    j => 10,
    k => 11,
    l => 12,
    m => 13,
    n => 14,
    o => 15,
    p => 16,
    q => 17,
    r => 18,
    s => 19,
    t => 20,
    u => 21,
    v => 22,
    w => 23,
    x => 24,
    y => 25,
    z => 26,
);

my $file = '/home/dculver/perl_scripts/names.txt';

open ( my $fh, '<', $file ) or die "$!\n";

my %name_hash;
my $index;
while ( my $line = <$fh> ) {
    my @names = split(/,/, $line);

    for my $name ( @names ) {
        my @split = $name =~ m/"(\w+)"/g; # get every name

        for my $entry ( @split ) {
            $index += 1;
            $name_hash{$entry} = $index;
        }
    }
}


my @values;
my $total;
my @products;
while ( my($key,$value) = each %name_hash ) {
    my @split_key = split ( m//m, $key );
    $total = 0;
    push @values, $total += $alphabet{lc$_} for @split_key;
    push @products, $values[-1] * $value;
    @values = ();
}

my $sum;
map { $sum += $_ } @products;
print "SUM OF ALL NAMES: ". $sum,"\n";
