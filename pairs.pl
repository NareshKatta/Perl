use strict;
use warnings;

my $inputs = <>;
chomp($inputs);
my @array = split ' ', $inputs;
my $n = $array[0];
my $k = $array[1];

$#array = -1;
$inputs = <>;
chomp($inputs);
@array = split ' ', $inputs;
@array = sort {$a <=> $b} @array;
my %hash = map {$_ => 1} @array;

my $count = 0;

for (my $i = 0; $i < @array; $i++) {
	my $temp = $array[$i] + $k;
	if($hash{$temp}) {
		$count++;
	}
}

print "$count\n"
