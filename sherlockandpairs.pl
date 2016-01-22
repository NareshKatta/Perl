use strict;
use warnings;

my $t = <>;
chomp($t);

for (my $i=0; $i<$t; $i++) {
	my $n = <>;
	chomp($n);
	my $input = <>;
	chomp($input);
	my @a = split ' ', $input;
	my %hash;
	for (my $j=0; $j<$n; $j++) {
		if($hash{$a[$j]}) {
			$hash{$a[$j]}++;
		} else {
			$hash{$a[$j]}++;
		}
	}
	my $count = 0;
	my $processed;
	foreach my $a (@a) {
		next if $processed->{$a};
		if($hash{$a}>1) {
			$count = $count + ($hash{$a})*($hash{$a}-1);
		}
		$processed->{$a} = 1;
	}
	print $count, "\n";
}
