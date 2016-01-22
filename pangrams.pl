use warnings;
use strict;

my $s = <> ;
$s = lc($s);
$s =~ s/\s//g;
my @str = split "", $s;
my @withoutDups = keys {map {$_ => 1} @str};
my $size = scalar @withoutDups;
if($size == 26) {
	print "pangram\n";

} else {
	print "not pangram\n";
}
