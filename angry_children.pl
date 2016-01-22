use strict;
use warnings;

my $n = <>;
chomp($n);
my $k = <>;
chomp($k);
my @array;
for (my $i = 0; $i<$n; $i++) {
	my $number =  <>;
	chomp($number);
	push @array, $number;
}
my @sortedArray = sort {$a <=> $b}@array;
my $j=0;
my $min = 9999999;
while(1) {
	if(($k-1+$j) < $#sortedArray ) {
		my @arraySlice = @sortedArray[$j..($k-1+$j)];
		my $count = $arraySlice[-1] - $arraySlice[0];
		if($count < $min) {
			$min = $count;
		}
		$j++;
	} else {
		last;
	}
}
print "$min\n";
