use strict;
use warnings;
use Data::Dumper;

my $n = <>;
chomp($n);
my @a;
for (my $i=0; $i<$n; $i++) {
	my $input = <>;
	chomp($input);
	my @temp = split '', $input;
	for (my $j=0; $j<$n;$j++) {
		$a[$i][$j] = $temp[$j];
	}
}
my @b = @a;
my $start = 1;
my $end = $n;
for (my $i=1; $i<$n-1; $i++) {
	for (my $j=1; $j<$n-1;$j++) {
		if($b[$i][$j-1] < $b[$i][$j] && $b[$i][$j+1] < $b[$i][$j] && $b[$i-1][$j] < $b[$i][$j] && $b[$i+1][$j] < $b[$i][$j]) {
			$a[$i][$j] = 'X';
		}
	}
}
for (my $i=0;$i<$n;$i++) {
	my $str = join '', @{$a[$i]};
	print $str,"\n";
}
