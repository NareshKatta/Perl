use strict;
use warnings;

my $n = <>;
chomp($n);

for (my $i=0; $i<$n; $i++) {
    my $str = <>;
    chomp($str);
    if($str =~ /\([+-]?([1-9]{1}\d?(?:\.\d+)?),\s[+-]?([1-9]{1}\d{0,2}(?:\.\d+)?)\)/) {
        my $x = $1;
        my $y = $2;
        #print "X:$x, Y:$y\n";
        if($x <=90 && $y <= 180) {
            print "Valid\n";
        } else {
            print "Invalid\n";
        }        
    } else {
        print "Invalid\n";
    }
}
