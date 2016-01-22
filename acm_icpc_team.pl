use strict;
use warnings;

my $input = <>;
chomp($input);

my @array = split ' ', $input;

my $n = $array[0];
my $m = $array[1];
my @values;
my $maxvalue = 0;
my $count = 0;

for (my $i=0; $i<$n;$i++) {
	my $value = <>;
	chomp($value);
	push @values, $value;
}

for (my $i = 0; $i< $n;$i++) {
	for (my $j = $i+1; $j < $n; $j++) {
		my $temp = 0;
		for (my $k = 0; $k<$m; $k++) {
			if(substr($values[$i], $k, 1) eq '1' or substr($values[$j], $k, 1) eq '1') {
				$temp++;
			}
		}
		if($temp >= $maxvalue) {
        	$count = 0 if $temp > $maxvalue;
        	$maxvalue = $temp;
          	$count++;
      	}

	} 
	
}

print "$maxvalue\n";
print "$count\n";

