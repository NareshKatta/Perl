use strict;
use warnings;

my $n = <>;
chomp($n);
my $total = 0;

for (my $i=0; $i<$n; $i++) { 
	my $tweet = <>;
	chomp($tweet);
	if($tweet =~ /hackerrank/i) {
		$total++;
	}
}

print "$toal\n";
