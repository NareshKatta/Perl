use strict;
use warnings;
use Data::Dumper;

my $input = <>;
chomp($input);
my @str1 = split '', $input;
$input = <>;
chomp($input);
my @str2 = split '', $input;
my %hash1;
my %hash2;
foreach my $a(@str1) {
	$hash1{$a}++;
}
foreach my $a(@str2) {
	$hash2{$a}++;
}


my $count = 0;

my $matched;
foreach my $a(@str1) {
	next if $matched->{$a};
	if($hash2{$a}) {
		$count = $count + $hash2{$a} - $hash1{$a} if $hash2{$a} > $hash1{$a};
		$count = $count + $hash1{$a} - $hash2{$a} if $hash1{$a} > $hash2{$a};
	} else {
		$count = $count + $hash1{$a}; 
	}
	$matched->{$a} = 1;
}
#print $count, "\n";
foreach my $a(@str2) {
	next if $matched->{$a};
	if($hash1{$a}) {
	} else {
		$count = $count + $hash2{$a};
	}
	$matched->{$a} = 1;
}

print $count, "\n";

