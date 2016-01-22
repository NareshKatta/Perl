use strict;
use warnings;
use Data::Dumper;

my $str = <>;
chomp($str);
my @array = ($str =~ /<div class="question-summary"(.*)<div class="question-summary"/isg);
print Dumper(@array);
