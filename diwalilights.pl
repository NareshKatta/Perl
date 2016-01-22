use strict;
use warnings;

my $t = <>;
chomp($t);

for (my $i=0; $i<$t; $i++) {
	my $n = <>;
	chomp($n);
	print $n*$n - $n + 1, "\n";
}
