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
my $reverse = 0;
my $start;
my $end;
for (my $i=0; $i<$n-1; $i++) {
	if($a[$i] < $a[$i+1] && $swap==0 && $reverse == 0) {
		next;
	#} elsif($a[$i] < $a[$i+1] && $swap ==1 && $reverse == 0) {
	#	if($a[$start] < $a[$i+1]) {
	#		$reverse = 1;
	#		$swap = 1;
	#	}
	} elsif ($a[$i] > $a[$i+1] && $swap == 0 && $reverse == 0) {
		$swap = 1;
		$start = $i;
		$end = $i + 1;
	} elsif($a[$i] > $a[$i+1] && $swap == 1 && $reverse == 0) {
		if($a[$i+2] && $a[$i+1] < $a[$i+2]) {
			$end = $i+1;
			
		} else {
			$reverse = 1;
			$swap = 0;
		}
	} elsif($a[$i] < $a[$i+1] && $swap == 0 && $reverse == 1) {
		$end = $i;
		last;
	}
}


$start = $start + 1;
$end = $end + 1;

if($swap == 1 && $reverse == 0) {
	print "yes\n";
	print "swap $start $end\n"
} elsif($swap == 0 && $reverse == 1) {	
	print "yes\n";
	print "reverse $start $end\n";
} elsif($swap == 1 && $reverse == 1) {
	print "no\n";
}

