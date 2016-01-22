use strict;
use warnings;

my $t = <>;
chomp($t);

for (my $i=0; $i<$t; $i++) {
	my $n = <>;
	chomp($n);
	my $arr = <>;
	chomp($arr);	
	my @array = split ' ', $arr;
	my $count = 1;
	for (@array) {
		$count = $count * $_;
		$count = $count % 1234567;
	}
	print "$count\n";
}
