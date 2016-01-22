use strict;
use warnings;

my $n = <>;
chomp($n);

my $inputs = <>;
chomp($inputs);
my @a = split ' ', $inputs;

my @b = @a;
@b = sort @b;
my $sortedString = join '', @b;
my $string = join '', @a;
if($string eq $sortedString) {
	print "yes\n";
	exit;
}

my $swap = 0;
my $startIndex;
my $endIndex;
my $count = 0 ;
my $reverse = 0;
for (my $i=0; $i<$n-1; $i++) {
	if($a[$i] > $a[$i+1] && $swap == 0) {
		$swap = 1;
		$startIndex = $i;
		$endIndex = $i+1;
		$count = 1;
	} elsif($a[$i] > $a[$i+1] && $swap == 1) {
		if($count == 1) {
			$swap = 1;
			$reverse = 0;
			$endIndex = $i+1;
			last;
		} else {
			$count++;
			$reverse = 1;
		}
	} elsif($a[$i] < $a[$i+1] && $swap == 1 && $count > 1) {
		$reverse = 1;
		$swap = 0;
		last;
	} elsif($a[$i] < $a[$i+1] && $swap == 1 && $count == 1) {
		$endIndex = $i+1;
		$swap = 1;
		$reverse = 0;
	}
	#print "Count : $count, Swap : $swap, Reverse : $reverse\n";
}

if($swap == 0 && $reverse == 1) {
	$endIndex = $startIndex + $count;
	$startIndex = $startIndex + 1;
	$endIndex = $endIndex + 1;
	print "yes\n";
	print "reverse $startIndex $endIndex\n"
} elsif($swap == 1 && $reverse == 0) {
	print "Start: $startIndex, End: $endIndex\n";
	my $temp = $a[$endIndex];
	$a[$endIndex] = $a[$startIndex];
	$a[$startIndex] = $temp;
	my $string = join '', @a;
	if($string eq $sortedString) {
		$startIndex = $startIndex + 1;
		$endIndex = $endIndex+1;
		print "yes\n";
		print "swap $startIndex $endIndex\n"
	} else {
		print "no\n";
	}
} elsif($swap == 1 && $reverse == 1) {
	print "no\n";
}
