use strict;
use warnings;
use Data::Dumper;

my $n = <>;
chomp($n);

my $inputs = <>;
chomp($inputs);
my @a = split ' ', $inputs;
my $start = 0;
my $end = $n;
Quicksort($start, $end-1);
my $x = 0;
my $y = 0;

sub Quicksort {
	my $start = shift;
	my $end = shift;
	print "$start :: $end\n";
	if($start < $end) {
		my ($pivotIndex) = partition($start, $end);
		Quicksort($start, $pivotIndex - 1);
		Quicksort($pivotIndex+1, $end);
	} else {
		$x = $start;
		if(@temp > 1) {
			print Dumper(@temp), "\n";
		}
	}
}


sub partition {
	my $start = shift;
	my $end = shift;
	my $pivot = $a[$start];
	my $pivotIndex = $start + 1;
	my @left;
	my @right;

	for (my $i=$start+1; $i<=$end; $i++) {
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

	my $temp = $a[$pivotIndex-1];
	$a[$pivotIndex-1] = $pivot;
	$a[$start] = $temp;
	my @temp = (@left, $pivot, @right);
	#print Dumper(@temp);

	#my $str1 = join ' ', @left;
	#my $str2 = join ' ', @right;
	#print "Str1 : $str1\n"; 
	#print "Str2 : $str2\n";
	my $str = join ' ', @a;
	print "$str\n";
	
	
	return ($pivotIndex-1);
}

my $str = join ' ', @a;
print "Str : $str\n";
