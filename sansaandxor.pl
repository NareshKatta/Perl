use strict;
use warnings;

my $t = <>;
chomp($t);
for (my $i=0; $i<$t; $i++) {
	my $n = <>;
	chomp($n);
	my $inputs = <>;
	chomp($inputs);
	my @a = split ' ', $inputs;
	if($n %2 == 0) {
		print 0, "\n";
	} else {
		my $sum=0;
		for (my $j=0; $j<$n; $j=$j+2) {
			$sum = $sum ^ $a[$j];
		}
		print $sum, "\n";
	}
}
