use strict;
use warnings;
use Data::Dumper;

my $n = <>;
chomp($n);

my $inputs = <>;
chomp($inputs);
my @a = split ' ', $inputs;

my $pivot = $a[0];
my $pivotIndex = 0;
my @left;
my @right;

for (my $i=0; $i<$n; $i++) {
	if($a[$i] < $pivot) {
		push @left, $a[$i];
		my $temp = $a[$pivotIndex];
		$a[$pivotIndex] = $a[$i]; 
		$a[$i] = $temp;
		$pivotIndex++;
		
	} else {
		push @right, $a[$i];
	}	
}


$a[$pivotIndex] = $pivot;

my $str1 = join ' ', @left;
my $str2 = join ' ', @right;
my $str = $str1. ' '. $str2;
print $str, "\n";
