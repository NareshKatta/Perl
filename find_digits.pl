use strict;
use warnings;

my $n = <>;
chomp($n);

for (my $i = 0; $i<$n; $i++) {
	my $N = <>;
	chomp($N);
	my $number = $N;
	my @array = split '', $N;
	my $count = 0;
	my $hash;
	foreach my $k (@array) {
		next if $k == 0;
		if($hash->{$k}) {
			$count++;
			next;
		}
		if($number % $k == 0) {
			$count++;
			$hash->{$k} = 1;
		}
	}
	print $count, "\n";
}
