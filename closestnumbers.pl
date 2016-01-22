use warnings;
use strict;

my $n = <>;
my $string = <>;
my @numbers = split ' ', $string;
my @sort = sort { $a <=> $b } @numbers;
my $diff;
undef @numbers;
for (my $i = 0; $i< @sort; $i++) {
	if(defined $sort[$i+1]) {
		my $temp = $sort[$i+1] - $sort[$i];
		push @{$diff->{$temp}}, $sort[$i] . ' '. $sort[$i+1];
	}
}
undef @sort;
my @keys = keys %{$diff};
my @sortKeys = sort {$a <=> $b} @keys;
my $required = $sortKeys[0];
foreach my $str(@{$diff->{$required}}) {
	print $str, " ";
}
print "\n";
