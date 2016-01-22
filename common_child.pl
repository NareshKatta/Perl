use strict;
use warnings;

my $a = <>;
my $b = <>;

chomp($a);
chomp($b);

my @str1 = split '', $a;
my @str2 = split '', $b;
my %hash1;
my %hash2;
foreach my $x(@str1) {
	$hash1{$x}++;
}
foreach my $x(@str2) {
    $hash2{$x}++;
}
my $length = 0;
my $visited;
foreach my $x (@str1) {
	if($hash2{$x} && !$visited->{$x}) {
		print "$x\n";
		if($hash1{$x} > $hash2{$x}) {
			$length = $length + $hash2{$x};
		} elsif($hash1{$x} < $hash2{$x}) {
			$length = $length + $hash1{$x};
		} else {
			$length = $length + $hash1{$x};
		}
		$visited->{$x} = 1;
	}
}

print "$length\n";
