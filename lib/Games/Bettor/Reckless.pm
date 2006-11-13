package Games::Bettor::Reckless;

use warnings;
use strict;
use Carp;

sub new{
	my ( $class, %args ) =  @_;
		
	bless{
	      name    => 'Reckless',
	}, $class;
}

sub name{
  my ( $self ) = @_;
  return $self->{'name'};
}

sub get_bet{
  my ( $self, %args ) = @_;
  
  my $bet;
  $bet = $args{'bankroll'};
  return $bet;
}

=head1 NAME

Games::Bettor::Reckless - A class that holds the methods for a reckless bettor

=head1 VERSION

Version 1.0

=cut

our $VERSION = '1.00';

=head1 SYNOPSIS


    use Games::Bettor::Reckless;

    $bettor = Games::Bettor::Reckless->new();

=head1 DESCRIPTION

This method represents a bettor who always bets his entire bankroll on each trial.  This is a bettor who is 
almost always guaranteed to go broke.

=head1 METHODS

=head2 new

  $method = Games::Bettor::Martingale->new();

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

    perldoc Games::Bettor::Reckless

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

1; # End of Games::Bettor::Reckless
