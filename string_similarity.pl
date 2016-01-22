use strict;
use warnings;

my $n = <>;
for (my $i = 0; $i<$n; $i++) {
	my $str = <>;
	chomp($str);
	my @str = split "", $str;
	my $count = length($str);
	for (my $i = 1; $i < length($str); $i++) {
		if($str[$i] eq $str[0])	{
			my $substr = substr($str, $i, length($str));
			if($str =~ /^($substr)/) {
				$count = $count + length($1);
			} else {
				if(length($substr) == 1) {
					$count = $count + 1;
				} else {
					my @substrArray = split "", $substr;
					foreach (my $k =1; $k<length($substr); $k++) {
						if($str[$k] eq $substrArray[$k]) {
							next;
						} else {
							$count = $count + $k;
							last;
						}
					}
				}
			}
		}
	}
	print "$count\n";
}
