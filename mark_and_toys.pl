use strict;
use warnings;


my $inputs = <>;
chomp($inputs);

my @array = split ' ', $inputs;
my $n = $array[0];
my $k = $array[1];
$#array = -1;

my $input = <>;
chomp($input);
@array = split ' ', $input;

@array = sort {$a <=> $b} @array;
my $sum = 0;
my $count = 0;

for(my $i=0; $i < @array; $i++) {
	if($sum > $k) {
		$count = $i-1;
		last;
	}
	$sum = $sum + $array[$i];
}

print "$count\n";
