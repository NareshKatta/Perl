# This script is used to generate history from history collection

use Data::Dumper;
use MongoDB;
use Text::CSV;
use DateTime;
use strict;
use warnings;


my $companyKeyVariables;
my $variables = getVariablesFromModel();

## Mandatory fields that needs to be fetched
my $fieldsToFetch = $variables;
$fieldsToFetch->{'factsetpermanentsecurityid'} = 1;
$fieldsToFetch->{'_id'} = 0;
$fieldsToFetch->{'asofdate'} = 1;
$fieldsToFetch->{'currency'} = 1;

# Establish mongo connection to localhost
my $localhost = MongoDB::MongoClient->new(
			host => 'localhost',
                       	username => 'admin',
                    	password=> '8tHXCBFKKTavHKF',
                  	db_name=> 'admin',
                     	port => '27017',
                   	query_timeout => 1200000
         	);
# Select the appropriate dbs and collections
my $localdb = $localhost->get_database('alertsDB');
my $previousStateCollection = $localdb->get_collection('variables_previous_state_12072015');
my $historyCollection = $localdb->get_collection('variables_history_12072015');
my $previousState;

# Establish connection to 43 machine
my $client = MongoDB::MongoClient->new(
			host => '10.208.224.91',
			username => 'admin',
			password=> '8tHXCBFKKTavHKF',
			db_name=> 'admin',
			port => '27017',
			query_timeout => 1200000
			);

# Select the arch database and companyKeyVariables Collection
my $database = $client->get_database('stockscreenerArch');
my $collection = $database->get_collection('history');

#Get the companies symbolds and generate history for one company ata time
my @companies = getCompaniesList();
foreach my $company(@companies) {
	my $datestring = localtime();
	print "Company : ", $company->{'symbol'}, "Currency:", $company->{'currency'}, $datestring, "\n";
	my $keyVariablesCursor = $collection->find({'symbol' => $company->{'symbol'}, 'currency' => $company->{'currency'}})->sort({'asofdate'=> 1});

	eval{$keyVariablesCursor->fields($fieldsToFetch)};
	my $doc;
	while (eval {$doc = $keyVariablesCursor->next}) {
		my $id = $doc->{'factsetpermanentsecurityid'};
		my $previousState = getVariablesPreviousState($id, $doc->{'currency'});
	
		if(!defined $previousState || !$previousState->{$id}) {
			$doc->{'createddate'} = $doc->{'asofdate'};
			$doc->{'updateddate'} = $doc->{'asofdate'};
			insertIntoVariablesPreviousState($doc);
			foreach my $variable (keys % {$variables}) {
				next if $variable eq 'asofdate';
				my $insert;
				$insert->{'variable'}	 = $variable;
				$insert->{'variabledisplayname'} = $companyKeyVariables->{$variable}->{'variabledisplayname'};
				$insert->{'quadrants'} = $companyKeyVariables->{$variable}->{'quadrants'};
				$insert->{'usedinreports'} = $companyKeyVariables->{$variable}->{'usedinreports'};
				$insert->{'createddate'} = $doc->{'asofdate'};
				$insert->{'factsetpermanentsecurityid'} = $doc->{'factsetpermanentsecurityid'};
				$insert->{'variablevalue'} = $doc->{$variable};
				$insert->{'previousstate'} = '';
				$insert->{'currency'} = $doc->{'currency'};
				insertIntoVariablesHistory($insert);
			}	
		}else {
			foreach my $variable (keys % {$variables}) {
				next if $variable eq 'asofdate';
				if($doc->{$variable} && $previousState->{$id}->{$variable} && ($doc->{$variable} ne $previousState->{$id}->{$variable})) {
					my $insertRecord = 1;
					if($companyKeyVariables->{$variable}->{'isnumeric'} eq 'TRUE') {
						if($doc->{$variable} ne 'NA' && $previousState->{$id}->{$variable} ne 'NA' && $doc->{$variable} == $previousState->{$id}->{$variable}) {
							$insertRecord = 0;
						} else {
							if($doc->{$variable} eq 'NA' or $previousState->{$id}->{$variable} eq 'NA') {
							} else {
								my $change = $doc->{$variable} - $previousState->{$id}->{$variable};
								$change = abs($change);	
								my $percentChange = ($change * 100 ) / $doc->{$variable};
								if($percentChange < 10) {
									$insertRecord = 0;
								}
							}
						}
					}
					if($insertRecord == 1) {
					my $insert;
                        		$insert->{'variable'}    = $variable;
                        		$insert->{'variabledisplayname'} = $companyKeyVariables->{$variable}->{'variabledisplayname'};
                        		$insert->{'quadrants'} = $companyKeyVariables->{$variable}->{'quadrants'};
                        		$insert->{'usedinreports'} = $companyKeyVariables->{$variable}->{'usedinreports'};
                        		$insert->{'createddate'} = $doc->{'asofdate'};
                        		$insert->{'factsetpermanentsecurityid'} = $doc->{'factsetpermanentsecurityid'};
                        		$insert->{'previousstate'} = $previousState->{$id}->{$variable};
					$insert->{'variablevalue'} = $doc->{$variable};
					$insert->{'currency'} = $doc->{'currency'};
                        		insertIntoVariablesHistory($insert);
					}
				}
			}
			$doc->{'updateddate'} = $doc->{'asofdate'};
			updateVariablesPreviousState($doc->{'factsetpermanentsecurityid'}, $doc);
		}
	
	}
}


sub getVariablesFromModel {
	my $csv = Text::CSV->new({ sep_char => ',' });
	my $file = "/var/www/CapitalCube/Engine2.0/app/engine/modelCSV/companyKeyVariables.csv";
	open(my $data, '<', $file) or die "Could not open '$file' $!\n";
	while (my $line = <$data>) {
  		if ($csv->parse($line)) {
      			my @fields = $csv->fields();
			next if !$fields[3] or $fields[3] eq 'FALSE';
			my $variableName = $fields[0];
			$variableName = lc $variableName;
			$variableName =~ s/\./_/g;
			$companyKeyVariables->{$variableName}->{'variablename'} = $variableName;
			$companyKeyVariables->{$variableName}->{'variabledisplayname'} = $fields[1];
			$companyKeyVariables->{$variableName}->{'quadrants'} = $fields[2];
			$companyKeyVariables->{$variableName}->{'usedinreports'} = $fields[3];
			$companyKeyVariables->{$variableName}->{'isnumeric'} = $fields[4];
  		} else {
     	 		warn "Line could not be parsed: $line\n";
  		}
	}
	my %hash = map {$_ => 1} keys %{$companyKeyVariables};
	return \%hash;
}

sub getVariablesPreviousState {
	my ($factsetid, $currency) = @_;
	my $previousStateCursor = $previousStateCollection->find({'factsetpermanentsecurityid' => $factsetid, 'currency' => $currency});
	my $row;
	my $previousState;
	while(eval {$row = $previousStateCursor->next}) { 
		my $factsetpermanentsecurityid = $row->{'factsetpermanentsecurityid'};
		$previousState->{$factsetpermanentsecurityid} = $row;
	}
	return $previousState;
}

sub insertIntoVariablesPreviousState {
	my $record = shift;
	$previousStateCollection->insert($record);
}

sub insertIntoVariablesHistory {
	my $record = shift;
	$historyCollection->insert($record);
}

sub updateVariablesPreviousState {
	my $factsetid = shift;
	my $updaterecord = shift;
	$previousStateCollection->update({'factsetpermanentsecurityid' => $factsetid, 'currency' => $updaterecord->{'currency'}}, {'$set' => $updaterecord});
}

sub getCompaniesList {
	my $stockscreenerdb = $localhost->get_database('stockscreener');
	my $companiesCollection = $stockscreenerdb->get_collection('companies');
	my $companiesCursor = $companiesCollection->find();
	my $fields = {'factsetpermanentsecurityid' => 1, 'symbol' => 1, 'currency' => 1, '_id' => 0};
	eval{$companiesCursor->fields($fields)};
	my $row;
	my @companies;
	while (eval {$row = $companiesCursor->next}) {
		push @companies, $row;
	}
	return @companies;
}

