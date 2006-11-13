#!perl -T

use Test::More tests => 3;

BEGIN {
	use_ok( 'Games::Bettor::Reckless' );
}

my $method = Games::Bettor::Reckless->new();

ok( $method->name eq 'Reckless', 'Name check' );
ok( $method->get_bet(  bankroll => 1000 ) eq 1000, 'Entire bankroll' );