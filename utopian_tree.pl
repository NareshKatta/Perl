use strict;
use warnings;

my $count = <>;
getCycleCounts();
chomp($count);
my @array;
sub count {
	my $n = shift;
	if($n == 0) {
		return 1;
	}
	if($n == 1) {
		return 2;
	}
	if($array[$n]) {
		return $array[$n];
	}
	return count($n-1) + 1 if $n%2 == 0;
	return count($n-1) *2 if $n%2 != 0;
}
sub getCycleCounts {
	for (my $k =0; $k<60; $k++) {
		my $value = count($k);
		$array[$k] = $value;
	}
}
for (my $i=0; $i<$count; $i++) {
	my $number = <>;
	chomp($number);
	print $array[$number], "\n";
}
