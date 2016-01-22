use strict;
use warnings;
use Data::Dumper;

my $n = <>;
for(my $i =1 ; $i<=$n; $i++) {
    my $dollars = <>;
    my $flavors = <>;
    my $flavorsString = <>;
    my @flavors = split ' ', $flavorsString;
	for (my $k = 0; $k < @flavors; $k++) {
		for (my $j = $k+1; $j<@flavors; $j++ ) {
			my $sum = $flavors[$k] + $flavors[$j];
			if($sum == $dollars) {
				if($k > $j) {
					print $j+1, ' ', $k+1, "\n";
				}  else {
					print $k+1, ' ', $j+1, "\n";
				}
			}
		}
	}
}
