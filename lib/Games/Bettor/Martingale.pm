package Games::Bettor::Martingale;

use warnings;
use strict;
use Carp;
use Data::Dumper;

sub new{
	my ( $class, %args ) =  @_;
		
  $args{'percent'} = 0 unless exists $args{'percent'} && defined $args{'percent'};
  
	bless{
	      name      => 'Martingale',
	      amount    => $args{'amount'},
	      percent   => $args{'percent'} * .01,
	      prior_bet => undef
	}, $class;
}

sub name{
  my ( $self ) = @_;
  return $self->{'name'};
}

sub get_bet{
  my ( $self, %args ) = @_;

  my $bet;

  # if there's no prior bet, this is the first bet, so return the base bet
  # otherwise, check the prior result
  #   if the prior result was a win, use the base bet
  #   otherwise, double the size of the last bet and return that
  if( ! defined $self->{'prior_bet'} ){
      $bet = _get_base_bet( $self, $args{'bankroll'} );    
  }else{    
    if( $args{'history'}[-1]{'result'} == 1 ){
      $bet = _get_base_bet( $self, $args{'bankroll'} );
    }else{
      $bet = $self->{'prior_bet'} * 2;
    }
  }

  $self->{'prior_bet'} = $bet;
  
  return $bet;
}

sub _get_base_bet{
  my ( $self, $bankroll ) = @_;

  my $bet;
  
  if(     $self->{'amount'}  ){ $bet = $self->{'amount'};
  }elsif( $self->{'percent'} ){ $bet = $bankroll * $self->{'percent'};
  }else{                        $bet = 0;
  }    
  
  return $bet;
}

=head1 NAME

Games::Bettor::Martingale - A class that holds the methods for a martingale bettor

=head1 VERSION

Version 1.0

=cut

our $VERSION = '1.00';

=head1 SYNOPSIS


    use Games::Bettor::Martingale;

    $bettor = Games::Bettor::Martingale->new( amount => 1 );
    $bettor = Games::Bettor::Martingale->new( percent => 10 );

=head1 DESCRIPTION

This method represents a bettor who always bets using the Martingale system.  This bettor will always bet the
same amount on the first bet and on any subsequent bet where he has won the previous trial.  If he has lost
the previous trial, he will double his last bet until he wins.  

=head1 METHODS

=head2 new

  $method = Games::Bettor::Martingale->new( amount => 1 );
  $method = Games::Bettor::Martingale->new( percent => 10 );
  
  amount: The amount of bet on each round in absolute betting units.
  percent: The amount fo bet on each round in percentage of bankroll.

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

    perldoc Games::Bettor::Martingale

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

1; # End of Games::Bettor::Martingale
