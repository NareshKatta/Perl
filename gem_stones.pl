use strict;
use warnings;

my $n = <>;
my %hash;
for (my $i=0; $i<$n; $i++) {
	my $input = <>;
	chomp($input);
	my @array = split '', $input;
	my %tempHash = map {$_ => 1} @array;
	foreach my $a(keys %tempHash) {
		$hash{$a}++;
	}
}
my $count = 0;
foreach my $key (sort { $hash{$b} <=> $hash{$a} } keys %hash) {
	if($hash{$key} == $n) {
		$count++;
	} elsif($hash{$key} < $n) {
		last;
	}
}
print "$count\n";
