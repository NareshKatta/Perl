use strict;
use warnings;

my $n = <>;
chomp($n);
for(my $i=0; $i<$n; $i++) {
	my $pan = <>;
	chomp($pan);
	if($pan =~ /^[A-Z]{5}\d{4}[A-Z]$/) {
		print "YES\n";
	} else {
		print "NO\n";
	}
}
