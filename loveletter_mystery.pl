use strict;
use warnings;

my $n = <>;
my $number = 1;
my %alpha_nums;
foreach('a'..'z'){
        $alpha_nums{$_} = $number;
        $number++;
}

for (my $i=0; $i<$n; $i++) {
	my $string = <>;
	chomp($string);
	my @array = split '', $string;
	my $count = 0;
	for (my $j = 0; $j<$#array/2; $j++) {
		if($alpha_nums{$array[-($j+1)]} > $alpha_nums{$array[$j]}) {
			$count = $count + $alpha_nums{$array[-($j+1)]}-$alpha_nums{$array[$j]};
		} else {
			$count = $count + $alpha_nums{$array[$j]} - $alpha_nums{$array[-($j+1)]};
		}
	}
	print $count, "\n";
}
