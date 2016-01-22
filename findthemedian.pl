use strict;
use warnings;
use POSIX;
use Data::Dumper;

my $n = <>;
chomp($n);

my $input = <>;
chomp($input);
my $index = floor($n/2);
my @array = split ' ', $input;
@array = sort {$a <=> $b}@array;
print $array[$index], "\n";
