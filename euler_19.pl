use strict;
use warnings;
use Data::Dumper;
use DateTime;
## SOLVED
my $start_date = DateTime->new(
    year  => 1901,
    month => 1,
    day => 1,
);

=cut
my $end_date = DateTime->new(
    year  => 2000,
    month => 12,
);
=cut

my $total = 0;

while ( $start_date->year != 2001 ) {
    print $start_date->day_name."  ".$start_date->day." ". $start_date->year,"\n";
    if ( $start_date->day_name eq 'Sunday' && $start_date->day == 1 ) {
        $total++;
        print "total: ". $total;
    }
    $start_date->add( days => 1);
}
print $total,"\n";
