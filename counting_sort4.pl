use strict;
use warnings;
use POSIX;
use Data::Dumper;

my $n = <>;
chomp($n);

my %hash;
my $start = 0;
if($n%2 == 0) {
	$start = $n/2;
} else {
	$start = floor($n/2);
}

my $hash1;
for (my $i=0; $i<$n; $i++) {
    my $input = <>;
    chomp($input);
    my @array = split ' ', $input;
	my $temp;
	$temp->{'element'} = $array[1];
	if($i< $n/2) {
		$temp->{'firsthalf'} = 1;
	}
    push @{$hash{$array[0]}}, $temp;
}
#print Dumper(%hash);
my @keys = sort {$a <=> $b} keys %hash;
my $j = 0;
foreach my $key (@keys) {
	foreach my $element (@{$hash{$key}}) {
		if($element->{'firsthalf'}) {
			print '-', " ";
		} else {
			print $element->{'element'}, ' ';
		}
	}
}
print "\n";
