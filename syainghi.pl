use strict;
use warnings;

my $n = <>;
for (my $i=0;$i<$n;$i++) {
	my $str = <>;
	chomp($str);
	if($str =~ /^(hi)\s[dD]/) {
		print "$str\n";
	} 
}
