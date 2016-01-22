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

my $i = 0;
my $k = 0;
my $zeros = -1;
for (my $j=$p; $j<=$q; $j++) {
	
	my @temp;
	if($i >= $n) {
		$i = $n-1;
	}
	my @A = @a[$k..$i];
	foreach my $A (@A) {
        my $diff = $A > $j ? $A-$j: $j-$A;
        push @temp, $diff;
    }
    @temp = sort {$a <=> $b} @temp;
    my $required = $temp[0];
    if(!$visited->{$required}) {
        $hash{$j} = $required;
        $visited->{$required} = 1;
    }
	if($temp[0] == 0) {
		$i++;
		$zeros++;
		if($zeros >=0) {
			$k = $zeros;
		}
	}
}


$i=1;
foreach my $a (sort {$hash{$b} <=> $hash{$a}} keys %hash) {
	print "$a\n";
	last if $i==1;
}
