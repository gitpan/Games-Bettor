#!perl -T

use Test::More tests => 8;

BEGIN {
	use_ok( 'Games::Bettor' );
	use_ok( 'Games::Bettor::Consistent' );
}

my $bettor = Games::Bettor->new( name => 'Test', bankroll => 1000, method => Games::Bettor::Consistent->new( amount => 1 ) );

ok( $bettor->name() eq 'Test', 'Getting name' );

# Test the reporting
my $report = $bettor->report();
ok( $report->{'name'} eq 'Test', 'Report name' );
ok( $report->{'bankroll_current'} == 1000, 'Bankroll unchanged' );

# Increate bankroll by 1 and test the report
$bettor->log_result( result => 1 );  
$report = $bettor->report();
ok( $report->{'bankroll_current'} == 1001, 'Bankroll increase' );

# Decrease bankroll by 2 and test the report
$bettor->log_result( result => 0 );  
$bettor->log_result( result => 0 );  
$report = $bettor->report();
ok( $report->{'bankroll_current'} == 999, 'Bankroll decrease' );

# See if we have captured all the trial results in the history
ok( scalar @{ $report->{'history'} } eq 3, 'History count' );
