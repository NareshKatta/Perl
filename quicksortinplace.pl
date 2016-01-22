use strict;
use warnings;
use Data::Dumper;

my $n = <>;
chomp($n);

my $inputs = <>;
chomp($inputs);
my @a = split ' ', $inputs;
my @array = @a;
my $start = 0;
my $end = $n;
my $swaps = 0;
my $shifts = 0;
Quicksort($start, $end-1);
Insertionsort();

sub Insertionsort {
	for (my $i=1; $i<@array; $i++) { 
		my $v = $array[$i];
		my $hole = $i;

		while ($hole > 0 && $v < $array[$hole-1]) {
			$array[$hole] = $array[$hole-1];
			$hole--;
			$shifts++;
		}
		$array[$hole] = $v;
	}
}

sub Quicksort {
	my $start = shift;
	my $end = shift;
	if($start < $end) {
		my ($pivotIndex) = partition($start, $end);
		Quicksort($start, $pivotIndex - 1);
		Quicksort($pivotIndex+1, $end);
	}
}


sub partition {
	my $start = shift;
	my $end = shift;
	my $pivot = $a[$end];
	my $pivotIndex = $start;
	$swaps = $swaps ? $swaps : 0;

	for (my $i=$start; $i<$end; $i++) {
		if($a[$i] < $pivot) {
			my $temp = $a[$pivotIndex];
			$a[$pivotIndex] = $a[$i]; 
			$a[$i] = $temp;
			$pivotIndex++;
			$swaps = $swaps + 1;
		} 
	}
	my $temp = $a[$pivotIndex];
	$a[$pivotIndex] = $a[$end];
	$a[$end] = $temp;
	$swaps = $swaps + 1;
	
	return ($pivotIndex);
}

#print "Swaps : $swaps\n";
#print "Shifts : $shifts\n";

print $shifts - $swaps, "\n";
