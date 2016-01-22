use strict;
use warnings;

my $t = <>;
chomp($t);
for (my $i = 0; $i<$t; $i++) {
	my $n = <>;
	my $a = <>;
	my $b = <>;
	chomp($n);
	chomp($a);
	chomp($b);
	my $min = $a > $b ? $b : $a;
	my $max = $a > $b ? $a : $b;
	my $diff = $max - $min;
	$n = $n-1;
	my $str = $n * $min;
	my $next = $n * $min;
	my $limit = $max * $n;
	while($next < $limit) {
		$next = $next + $diff;
		$str = $str . ' ' . $next;
	}	
	print $str, "\n";
}

