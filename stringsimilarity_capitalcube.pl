use Lingua::EN::StopWords qw(%StopWords);
use Lingua::Stem::En;
use Lingua::EN::Splitter qw(words);
use List::Util qw(sum);
use MongoDB;
use MongoDB::OID;
use MongoDB::BSON;
use Data::Dumper;
use strict;

#print compare(
#   "The AD 79 volcanic eruption of Mount Vesuvius",
#   "The volcano, Mount Vesuvius, erupted in 79AD"
#);

my @companies = ('3107-MY',
		'7241-MY',
		'8044-MY',
		'7668-MY',
		'0165-MY',
		'4863-MY'
		);
print "\n";
my $client = MongoDB::MongoClient->new(host => 'localhost',username=>'admin',password=>'8tHXCBFKKTavHKF',db_name=>'admin', port => '27017', query_timeout => 1200000);
my $db = $client->get_database( 'ScriptsDB' );
my $screenerdb = $client->get_database('stockscreener');
my $naics = $db->get_collection( 'naicspeersupdated' );
my $companies = $screenerdb->get_collection('companies');
my $dbNew = $client->get_database('testdb');
my $newNaicsCollections = $dbNew->get_collection('test_naics');
foreach my $company (@companies) {
	my $companyData = eval{$companies->find({'symbol'=> $company})};
	my $companyCursor = $companyData->fields({'companyprofile' => 1, 'factsetpermanentsecurityid' => 1});
	my $companyRow = eval{$companyCursor->next};
	my $companyProfile = $companyRow->{'companyprofile'};
	my $fspermsecid = $companyRow->{'factsetpermanentsecurityid'};
	
	my $naicsData = eval {$naics->find({'symbol' => $company})};
	my $naicsCursor = $naicsData->fields({'regionalpeers' => 1, 'factsetpermanentsecurityid' => 1});
	my $row;
	my @symbolstogetprofiles;
	my $regionalpeers;
	my %tempHash;
	while (eval{$row = $naicsCursor->next}) {
		$regionalpeers = $row->{'regionalpeers'};
		foreach my $peer (@{$regionalpeers}) {
			my $peerCompanyProfile = $peer->{'companyprofile'};
			my $similarity = compare($companyProfile, $peerCompanyProfile);
			my $rank = $peer->{'rank'} + $similarity;
			$peer->{'rank'} = $rank;
			$tempHash{$peer->{'symbol'}} = $rank;
		}
        }
	my @sortedPeers;
	foreach my $symbol(reverse sort {$tempHash{$a} <=> $tempHash{$b}} keys%tempHash) {
		foreach my $peer(@{$regionalpeers}) {
			if($peer->{'symbol'} eq $symbol) {
				push @sortedPeers, $peer;
			}
		}
	}
	my $record;
	$record->{'factsetpermanentsecurityid'} = $fspermsecid;
	$record->{'symbol'}  = $company;
	$record->{'regionalpeers'} = \@sortedPeers;
	eval{$newNaicsCollections->insert($record)};

}


sub sentence2hash {
	my $words   = words(lc(shift));
        my $stemmed = Lingua::Stem::En::stem({
                        -words => [ grep { !$StopWords{$_} } @$words ]
                      });
        return { map {$_ => 1} grep $_, @$stemmed };
}

sub compare {
        my ($h1, $h2) = map { sentence2hash($_) } @_;
        my %composite = %$h1;
        $composite{$_}++ for keys %$h2;
        return 100*(sum(values %composite)/keys %composite)/2;
}
