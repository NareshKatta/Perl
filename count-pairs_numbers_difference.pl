use strict;
use warnings;

my $k = 4;
my @array = (3, 7, 9, 10, 11, 15, 19, 623);
my $i= 0;
my $j= 0;
my $count = 0;
while ($j<$#array) {
	if($array[$j] - $array[$i] == $k) {
		#print $array[$i]." ". $array[$j]."\n";
		$i++;
		$j++;
		$count++;
	} elsif($array[$j] - $array[$i] > $k) {
		$i++;
	} else {	
		$j++;
	}
}

print "Count : $count\n";
