my @years = (2014,2013, 2012, 2011, 2010, 2009, 2008, 2007, 2006, 2005, 2004);
my @months = ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12');

foreach my $y (@years) {
	foreach my $m (@months) {
		my $date = "01-$m-$y";
		$cmd = "sh test.sh $date";
		print "$cmd\n";
	}
}
