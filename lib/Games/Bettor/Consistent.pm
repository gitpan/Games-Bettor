package Games::Bettor::Consistent;

use warnings;
use strict;
use Carp;

sub new{
	my ( $class, %args ) =  @_;
		
  $args{'percent'} = 0 unless exists $args{'percent'} && defined $args{'percent'};
  
	bless{
	      name    => 'Consistent',
	      amount  => $args{'amount'}        || 0,
	      percent => $args{'percent'} * .01,
	}, $class;
}

sub name{
  my ( $self ) = @_;
  return $self->{'name'};
}

sub get_bet{
  my ( $self, %args ) = @_;
  
  my $bet;
  if(     $self->{'amount'}  ){ $bet = $self->{'amount'};
  }elsif( $self->{'percent'} ){ $bet = $args{'bankroll'} * $self->{'percent'};
  }else{                        $bet = 0;
  }

  return $bet;
}

=head1 NAME

Games::Bettor::Consistent - A class that holds the methods for a consistent bettor

=head1 VERSION

Version 1.0

=cut

our $VERSION = '1.00';

=head1 SYNOPSIS


    use Games::Bettor::Consistent;

    $bettor = Games::Bettor::Consistent->new( amount => 10 ); # always bets 10 units
    $bettor = Games::Bettor::Consistent->new( percent => 10 );  # always bets 10% of the bankroll

=head1 DESCRIPTION

This method represents a bettor who always bets the same amount on each trial.  The amount bet can be a flat 
amount of a percentage of the current bankroll, but it's always the same amount or percent.

=head1 METHODS

=head2 new

  $method = Games::Bettor::Consistent->new( amount => 1 );

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

    perldoc Games::Bettor::Consistent

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

1; # End of Games::Bettor::Consistent
