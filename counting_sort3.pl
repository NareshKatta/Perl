use strict;
use warnings;

my $n = <>;
chomp($n);

my %hash;

for (my $i=0; $i<$n; $i++) {
	my $input = <>;
	chomp($input);
	my @array = split ' ', $input;
	$hash{$array[0]}++;
}
for my $x (0..99) {
	$hash{$x} = $hash{$x} ? $hash{$x} : 0;
	if($hash{$x-1}) {
		$hash{$x} = $hash{$x} + $hash{$x-1};
	}
	print $hash{$x}, ' ';
}
print "\n";
