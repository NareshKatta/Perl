my @array = (0, 0, 0, 1, 1);
my $totalnumberofpairs = 0;
my $totalnumberofzeros = 0;
foreach my $a (@array) {
	if($a == 0) {
		$totalnumberofzeros++;
	}elsif($a == 1) {
		$totalnumberofpairs = $totalnumberofpairs + $totalnumberofzeros;
	}
}

print "Total Number of Pairs : $totalnumberofpairs\n";
