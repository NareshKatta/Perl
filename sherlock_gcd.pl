use strict;
use warnings;
use Data::Dumper;

my $n = <>;
chomp($n);
for (my $i=0; $i<$n; $i++) {
	my $count = <>;
	chomp($count);
	my $inputs = <>;
	chomp($inputs);
	my @array = split ' ', $inputs;
	my $yes = 0;
	for (my $i=0; $i<@array-1; $i++) {
		my $gcd = gcd($array[$i], $array[$i-1]);
		if($gcd == 1) {
			print "YES\n";
			$yes = 1;
			last;
		}
	}
	if($yes == 0)	{
		print "NO\n";
	}
}

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
   	return $dividend;
}

