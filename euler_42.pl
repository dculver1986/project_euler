use strict;
use warnings;

# SOLVED

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


my @triangular_sequence = _generate_triangular_sequence();

my $file = '/home/dculver/perl_scripts/words.txt';
open ( my $fh, '<', $file ) or die "$!\n";

my @word_sums;
while ( my $line = <$fh> ) {
    my @words = split(/,/, $line );

    for my $word ( @words ) {
        push @word_sums, sum_word($word);
    }
}

my $total_answer;
for my $sum ( @word_sums ) {
    for my $number ( @triangular_sequence ) {
        if ( $sum == $number ) {
            $total_answer++;
        }
    }
}

print "TOTAL: ". $total_answer,"\n";

sub sum_word {

    my $word = shift;
    my @split_word = split m//m, $word;

    my $value;
    my $result;
    my @letter_values;

    foreach my $letter ( @split_word ) {
        for my $key ( keys %alphabet ) {
            if (lc($letter) eq  $key ) {
                push @letter_values, $alphabet{$key};
            }
        }
    }

    my $sum;
    map { $sum += $_ } @letter_values;

    return $sum;
}

sub _generate_triangular_sequence {

    # Get all triangular numbers to 1000
    my $result;
    my @triangular_sequence_map;
    for (1..1000) {
        $result = .5 * $_*($_ + 1);
        push @triangular_sequence_map, $result;
    }
    return @triangular_sequence_map;
}

=cut
my @triangular_numbers;
for my $value ( values @triangular_sequence ) {
    for my $result ( values %$value ) {
        print $result,"\n";
        push @triangular_numbers, $result;
    }
}
=cut

