use warnings;
use strict;

my $input1 = <>;
my @inputs = split ' ', $input1;
my $n = $inputs[0];
my $k = $inputs[1];
undef @inputs;
my $inputs = <>;
my @costs = split " ", $inputs;
my @sort = sort {$a <=> $b} @costs;
undef @costs;
my $sum = 0;
my $iteration = 0;
if($n == $k) {
	foreach my $num (@sort) {
		$sum = $sum + $num;
	}
} else {
	for (my $i= @sort-1; $i >= 0;) {
		my $count = 0;
		while($count < $k) {
				$sum = $sum+($iteration+1)*$sort[$i] if $i >= 0;
				$i--;
				$count++;
		}
		$iteration++;
	}
}
print "$sum\n";
