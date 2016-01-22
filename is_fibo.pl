use strict;
use warnings;

my $count = <>;
getfebonacci();
chomp($count);
my @array;
my $febonacci;
sub febonacci {
	my $n = shift;
	if($n == 0) {
		return 0;
	}
	if($n == 1) {
		return 1;
	}
	if($array[$n]) {
		return $array[$n];
	}
	return febonacci($n-1) + febonacci($n-2);
}
sub getfebonacci {
	for (my $k =0; ;$k++) {
		my $value = febonacci($k);
		$array[$k] = $value;
		$febonacci->{$value} = 1;
		if($value > 10000000000){
			last;
		}
	}
}
for (my $i=0; $i<$count; $i++) {
	my $number = <>;
	chomp($number);
	if($febonacci->{$number}) {
		print "IsFibo\n";
	} else {
		print "IsNotFibo\n";
	}
}
