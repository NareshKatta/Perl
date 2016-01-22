use strict;
use warnings;

my $n = <>;
chomp($n);
for (my $i=0; $i<$n; $i++) {
	my $str = <>;
	chomp($str);
	if($str =~ /^hackerrank$/i) {
		print "0\n";
	} elsif($str =~ /^hackerrank/i) {
		print "1\n";
	} elsif($str =~ /hackerrank$/i) {
		print "2\n";
	} else {
		print "0\n";
	}
}
