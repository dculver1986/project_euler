use strict;
use warnings;
use Data::Dumper;

# SOLVED
#
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.
# n! means n × (n − 1) × ... × 3 × 2 × 1


my @factorials_to_sum;
my @digits;
my @digit_factorials;
my $product = 1;
my $sum;

for my $int ( 3..1000000 ) {
    @digits = split_number($int); # split to get the digits
    for my $digit ( @digits  ) {
        $product = generate_factorials($digit);
        push @factorials_to_sum, $product; # generate factors of the digits
        $sum = sum_array(@factorials_to_sum);
        if ( $sum == $int ) {
            push @digit_factorials, $sum;
        }

    }

    # clear the array to sum, I saved the ones I want above
    @factorials_to_sum = ();
}


my $final_sum = sum_array(@digit_factorials);
print "Goal: Find the sum of all numbers which are equal to the sum ".
"of the factorial of their digits.\n";
print "FINAL ANSWER: $final_sum\n";
print "DIGIT FACTORIALS FOUND:\n";
print Dumper(\@digit_factorials);


=head1 split_number

Takes a number and returns an array of the number split.

=cut

sub split_number {

    my $number = shift;
    my @result = split (m//m, $number);

    return @result;
}

=head1 generate_factorials

Returns factorial of a given number. For example: generate_factorials(4) will return 24.
This is because 4 x 3 x 2 x 1 = 24.

=cut

sub generate_factorials {

    my $number = shift;
    my $factor_product = 1;

    if ( $number == 1 ) {
        return $factor_product;
    }

    while ( $number > 1 ) {
        $factor_product *= $number;
        --$number;
    }

    return $factor_product;
}

=head1 sum_array

Return the sum of an array of numbers.

=cut

sub sum_array {

    my $sum;
    map { $sum += $_ } @_;

    return $sum;
}
