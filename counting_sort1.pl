use strict;
use warnings;

my $n = <>;
chomp($n);

my $inputs = <>;
chomp($inputs);

my @array = split ' ', $inputs;
my %hash;
foreach my $x(@array) {
	$hash{$x}++;
}
for my $x(0..99) {
	if($hash{$x}) {
		print $hash{$x}, ' ';
	} else {
		print 0, ' ';
	}
}
print "\n";
