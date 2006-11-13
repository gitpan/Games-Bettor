#!perl -T

use Test::More tests => 5;

BEGIN {
	use_ok( 'Games::Bettor::Consistent' );
}

my $absolute = Games::Bettor::Consistent->new( amount => 1 );
my $percent  = Games::Bettor::Consistent->new( percent => 10 );

ok( $absolute->name eq 'Consistent', 'Name check' );
ok( $percent->name eq 'Consistent', 'Name check' );

ok( $absolute->get_bet( bankroll => 100 ) eq 1,  'Absolute bet' );
ok( $percent->get_bet(  bankroll => 100 ) eq 10, 'Percentage bet' );



