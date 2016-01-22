use strict;
use warnings;

my $n = <>;
chomp($n);
for (my $i=0; $i<$n; $i++) {
	my $string = <>;
	chomp($string);
	my @array = split '', $string;
	my $count =0;
	for (my $j = 0; $j<$#array; $j++) {
		if($array[$j] eq $array[$j+1]) {
			$count++;
		}
	}
	print $count, "\n";
}
