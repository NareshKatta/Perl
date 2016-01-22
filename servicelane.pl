use strict;
use warnings;

my $inputs = <>;
chomp($inputs);
my @array = split ' ', $inputs;
my $n = $array[0];
my $t = $array[1];

$inputs = <>;
chomp($inputs);
my @a = split ' ', $inputs;

for (my $i=0; $i<$t; $i++) {
	$inputs = <>;
	chomp($inputs);
	@array = split ' ', $inputs;
	my $start = $array[0];
	my $end = $array[1];
	my @temp = @a[$start..$end];
	@temp = sort {$a <=> $b} @temp;
	print $temp[0], "\n"
}
