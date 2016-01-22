use strict; 
use Data::Dumper; 

my @booking = ('Luis', 'Hector', 'Selena', 'Emmanuel', 'Amish'); 
my @sorted; 
my $first = shift @booking; 
my $total = int ( ($#booking/2 ) * ($#booking + 1)); # to track the index by summing all the index 
print "Totol : $total\n\n";
#and substracting it from the used index 

push @sorted, $first; 
my $cnt = 0; 
my $last = lc(chop($first)); 

for (my $i = 0 ; $i <= $#booking; $i++ ){ 
	for(my $j=0; $j <=$#booking; $j++ ) { 
		if ($last eq (lc (substr ($booking[$j], 0, 1)))){ 
			$cnt = $cnt + $j; 
			my $tmp = $booking[$j]; 
			push (@sorted, $booking[$j]); 
			$last = lc chop($tmp); 
		} 
	}
	#print Dumper(@sorted), "\n"; 
} 

my $index = $total - $cnt ; 
print "Index : $index\n";
unshift (@sorted, $booking[$index]); 
print Dumper(@sorted);
