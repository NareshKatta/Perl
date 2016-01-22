use strict;
use warnings;
use Data::Dumper;


my $n = <>;
for (my $i = 0; $i < $n; $i++) {
	my $str = <>;
	chomp($str);
	my $len = length($str);
	if($len%2 != 0) {
		print "-1\n";
	} else {
		my @str = split "", $str;
		my @str1 = @str[0..($len/2-1)];
		my @str2 = @str[($len/2)..$len-1];
		@str1 = sort @str1;
		@str2 = sort @str2;
		my $hash1;
		my $hash2;
		foreach my $a(@str1) {
			$hash1->{$a}++;
		}
		foreach my $a(@str2) {
			$hash2->{$a}++;
		}
		my $str1 = join "", @str1;
		my $str2 = join "", @str2;
		if($str1 eq $str2) {
			print "0\n";
		} else {
			my $count1 = 0;
			my $count2 = 0;
			my $visited;
			foreach my $key (@str1) {
				next if $visited->{$key};
				$visited->{$key} = 1;
				if($hash1->{$key} && $hash2->{$key}) {
					if($hash1->{$key} > $hash2->{$key}) {
						$count1 = $count1 + $hash1->{$key} - $hash2->{$key};
					}
				} else {
					if($hash1->{$key}) {
						$count1 = $count1 + $hash1->{$key};
					}
				}
			}
			print "$count1\n";
		}

	}
}
