use strict;
use warnings;
use POSIX;

my $t = <>;
chomp($t);
for (my $i=0; $i<$t; $i++) {
	my $str = <>;
	chomp($str);
	my @str = split '', $str;
	my $j = 0;
	for ($j = 0; $j< @str/2;)	{
		if($str[$j] eq $str[-1-$j]) {
			$j++;
		} elsif($str[$j] eq $str[-2-$j]) {
			if($str[$j+1] ne $str[-3-$j]) {
				print $j, "\n";
            	last;
			} else {
				print -1+@str-$j, "\n";
				last;
			}
		} elsif($str[$j+1] eq $str[-1-$j]) {
			print $j, "\n";
			last;
		} else {
			$j++;
		} 
	}
	if(@str%2 == 0 && $j == @str/2) {
		print "-1", "\n";
	} elsif($j == floor((@str/2) + 1)) {
		print "-1", "\n";
	}
}
