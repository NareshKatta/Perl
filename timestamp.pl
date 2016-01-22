use Time::Piece;

my $startTime = localtime->strftime('%Y-%m-%d %H-%M-%S');
print "StartTime : $startTime\n";
my $endTime = localtime->strftime('%Y-%m-%d %H-%M-%S');
print "EndTime: $endTime\n";

