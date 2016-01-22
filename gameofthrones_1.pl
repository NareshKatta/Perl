use strict;
use warnings;

my $input = <>;
chomp($input);
my @array = split '', $input;
my $hash;
foreach $element (@array) {
	$hash->{$element}++;
}
my $noofodds = 0;
foreach my $key (keys %$hash) {
	if($hash->{$key} % 2 == 1) {
		$noofodds;
	}
}
if($noofodds > 1) {
	print "NO\n";
} else {
	print "YES\n"
}
