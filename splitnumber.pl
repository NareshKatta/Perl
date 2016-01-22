use strict;
use warnings;
use Data::Dumper;

my $n = <>;
chomp($n);

for (my $i=0; $i<$n; $i++) {
	my $str = <>;
	chomp($str);
	if($str =~ /(\d{1,3})[-\s]{1}(\d{1,3})[-\s]{1}(\d{4,10})/) {
		print "CountryCode=$1,LocalAreaCode=$2,Number=$3\n";
	}
}
