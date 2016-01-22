use strict;
use warnings;

my $t = <>;
chomp($t);

for (my $i=0; $i<$t; $i++) {
	my $inputs = <>;
	chomp($inputs);
	my @a = split ' ', $inputs;
	my $n = $a[0];
	my $k = $a[1];
	
	$inputs = <>;
	chomp($inputs);
	@a = split ' ', $inputs;
	$inputs = <>;
	chomp($inputs);
	my @b = split ' ', $inputs;

	@a = sort {$a <=> $b} @a;
	@b = sort {$b <=> $a} @b;
	my $yes = 1;
	for (my $j=0; $j<$n; $j++) {
		if($a[$j] + $b[$j] >= $k) {
			next;
		}
		$yes = 0;
		last;
	}
	
	print "YES\n" if $yes == 1;
	print "NO\n" if $yes == 0;
}
