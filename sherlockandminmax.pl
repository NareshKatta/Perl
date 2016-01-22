use strict;
use warnings;
use Data::Dumper;

my $n = <>;
chomp($n);

my $inputs = <>;
chomp($inputs);
my @a = split ' ', $inputs;
@a = sort {$a <=> $b} @a;

$inputs = <>;
my ($p, $q) = split ' ', $inputs;
my %hash;
my $visited;

for my $i ($p..$q) {
	my @temp;
	foreach my $a (@a) {
		my $diff = $a > $i ? $a-$i: $i-$a;
		push @temp, $diff;
	}
	print Dumper(@temp);
	@temp = sort {$a <=> $b} @temp;
	my $required = $temp[0];
	print "I:$i, Min : $required\n";
	if(!$visited->{$required}) {
		$hash{$i} = $required;
		$visited->{$required} = 1;
	}
}

my $i=1;
foreach my $a (sort {$hash{$b} <=> $hash{$a}} keys %hash) {
	print "$a\n";
	last if $i==1;
}
