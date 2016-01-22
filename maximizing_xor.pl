use strict;
use warnings;

my $m = <>;
my $n = <>;
chomp($m);
chomp($n);
my $max = -1;

for (my $i= $m; $i<=$n-1; $i++) {
	my $x = $i ^ ($i+1);
	if($x > $max) {
		$max = $x;
	}
}

print "$max\n";
