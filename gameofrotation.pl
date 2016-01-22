use strict;
use warnings;

my $n = <>;
chomp($n);

my $inputs = <>;
chomp($inputs);

my @a = split ' ', $inputs;
my @b = sort {$b <=> $a} @a;
my $max = $b[0];
my $match;
my $sum = 0;
for (my $i=0; $i<$n; $i++) {
	if($a[$i] == $max) {
		$match = $i;
	}
}
print "Match: $match, N:$n\n";
my $noofrotations = $n-$match-1;
for (my $i=0; $i<$n; $i++) {
	my $index;
	if($i+$noofrotations>=$n) {
		$index = $n-$i+$noofrotations;
	} else {
		$index = $i+$noofrotations;
	}
	print "index: $index\n";
	print "Element", $a[$index], "\n";
	$sum = $sum + $a[$index] * ($i+1);
	print "Sum: $sum", "\n";
}

print "$sum\n";
