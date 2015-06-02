use strict;
use warnings;
use Data::Dumper;
use Lingua::Any::Numbers qw(:std :all);
## SOLVED
my $total = 0;
foreach my $number ( 1..1000 ) {
    my $string_number = to_string($number);
    $string_number =~ s/-|\s//g;
    $total += length($string_number);
}
print $total, "\n";
