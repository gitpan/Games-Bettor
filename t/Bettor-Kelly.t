#!perl

use Test::More tests => 3;

BEGIN {
	use_ok( 'Games::Bettor::Kelly' );
}

my $method = Games::Bettor::Kelly->new( winner => 60, odds => 1 );

ok( $method->name eq 'Kelly Criterion', 'Name check' );
ok( $method->get_bet( bankroll => 1000 ) eq 200,  'Kelly bet' );
