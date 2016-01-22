use strict;
use warnings;

my $n = <>;
chomp($n);

for (my $i=0; $i<$n; $i++) {
    my $str = <>;
    chomp($str);
    if($str =~ /^[a-z]{0,3}[0-9]{2,8}[A-Z]{3,}/){
        print "VALID\n";
    } else {
        print "INVALID\n";
    }
}
