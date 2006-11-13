package Games::Bettor::Kelly;

use warnings;
use strict;
use Carp;
use Data::Dumper;

sub new{
	my ( $class, %args ) =  @_;
		
	bless{
	      name       => 'Kelly Criterion',
	      win_chance => $args{'winner'},
	      odds       => $args{'odds'},
	}, $class;
}

sub name{
  my ( $self ) = @_;
  return $self->{'name'};
}

sub get_bet{
  my ( $self, %args ) = @_;

  # percent_of_br_to_bet = (odds received * probability of winning - probability of losing )/odds received
  # bet = bankroll * percent_of_br_to_bet
  my $percent = ( ( $self->{'odds'} * $self->{'win_chance'} ) - ( 100 - $self->{'win_chance'} ) ) / $self->{'odds'} / 100;

  my $bet = $percent * $args{'bankroll'};


  return $bet;
}

=head1 NAME

Games::Bettor::Kelly - A class that holds the methods for a kelly formula bettor

=head1 VERSION

Version 1.0

=cut

our $VERSION = '1.00';

=head1 SYNOPSIS


    use Games::Bettor::Kelly;

    $bettor = Games::Bettor::Kelly->new( winner => 75, odds => 2);

=head1 DESCRIPTION

This method represents a bettor who always bets using the Kelly Criterion system.  Basically, the Kelly bettor
bets only a portion of his bankroll.  This criterion is supposed to balance risk of ruin with the best rate of
return.  Since only a portion of the bankroll is bet, the bettor can never go broke.

=head1 METHODS

=head2 new

  $method = Games::Bettor::Kelly->new( winner => $winning_percentage, odds => $odds );
  
  winner: The percentage of the time you expect to win expressed as a percentage, ie 65.
  odds: The left side of an odds expression.  5:1 would be expressed as 5 and even money odds would just be 1:1 or 1.

=head2 name

  $method_name = $method->name();
  
  Returns the name of the betting method.

=head2 get_bet

  $amount = $method->get_bet( bankroll => $bankroll );
  
  Returns the amount to bet for this trial.  The bankroll argument is the amount of the bankroll currently for 
  the Bettor object using this method.

=head1 AUTHOR

Troy Denkinger, C<< <tdenkinger at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-games-bettor at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Games-Bettor>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Games::Bettor::Kelly

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Games-Bettor>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Games-Bettor>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Games-Bettor>

=item * Search CPAN

L<http://search.cpan.org/dist/Games-Bettor>

=back

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2006 Troy Denkinger, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Games::Bettor::Kelly
