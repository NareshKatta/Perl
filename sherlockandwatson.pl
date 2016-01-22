use strict;
use warnings;
use Data::Dumper;

my $inputs = <>;
chomp($inputs);
my @array = split ' ', $inputs;
my $n = $array[0];
my $k = $array[1];
my $q = $array[2];

$inputs = <>;
chomp($inputs);
@array = split ' ', $inputs;
#print Dumper(@array);

for (my $i=0; $i<$q; $i++) {
	my $index = <>;
	chomp($index);
	if($k>=$n && $k%$n==0) {
	} else {
		if($k >$n) {
			$k = $k % $n;
			$index = $index - $k;
		} else {
			$index = $index - $k;
		}
	}
	print $array[$index], "\n";
}
