use strict;
use warnings;

my $input = <>;
my @array = split ' ', $input;

my $input1 = $array[0];
my $input2 = $array[1];
my $gcd = gcd($input1, $input2);

sub gcd {
	my ($input1, $input2) = @_;
	my $dividend = $input1 > $input2 ? $input1 : $input2;
	my $divisor = $input1 > $input2 ? $input2 : $input1;
	my $remainder = 999999;
	while($remainder != 0) {
		$remainder = $dividend % $divisor;
		my $quotient = $dividend / $divisor;
		$dividend = $divisor;
		$divisor = $remainder;
	}
	print "GCD : $dividend\n";
}
