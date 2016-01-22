use strict;
use warnings;
use DateTime;

my $date = '2014-01-31';
my @date = split '-', $date;
my $datetime = DateTime->new(
							'year' => $date[0],
							'month' => $date[1],
							'day' => $date[2],
							);

print $datetime, "\n";
