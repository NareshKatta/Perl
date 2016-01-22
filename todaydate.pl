use POSIX qw(strftime);

my $date = strftime "%Y-%m-%d", localtime;
print "Date : $date\n";
