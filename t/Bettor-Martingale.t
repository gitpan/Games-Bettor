#!perl -T

use Test::More tests => 9;

BEGIN {
	use_ok( 'Games::Bettor::Martingale' );
}

my $absolute = Games::Bettor::Martingale->new( amount => 1 );
my $percent  = Games::Bettor::Martingale->new( percent => 10 );

ok( $absolute->name eq 'Martingale', 'Name check' );
ok( $percent->name eq 'Martingale', 'Name check' );

ok( $absolute->get_bet( bankroll => 1000 ) eq 1,  'Absolute bet' );
ok( $percent->get_bet( bankroll => 1000 ) eq 100,  'Percentage bet' );

# Test on a loss, create a loss history record and pass it in
my %result = ( result => 0 );
my @history;
push @history, \%result;
ok( $absolute->get_bet( history => \@history, bankroll => 1000 ) eq 2,  'Absolute bet - After loss' );
ok( $percent->get_bet( history => \@history, bankroll => 1000 ) eq 200,  'Percent bet - After loss' );

# Test on a win, create a win history record and pass it in
%result = ( result => 1 );
push @history, \%result;
ok( $absolute->get_bet( history => \@history, bankroll => 1000 ) eq 1,  'Absolute bet - After win' );
ok( $percent->get_bet( history => \@history, bankroll => 1000 ) eq 100,  'Percent bet - After win' );

