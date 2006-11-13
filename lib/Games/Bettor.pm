package Games::Bettor;

use warnings;
use strict;
use Carp;
use Data::Dumper;

sub new{
	my ( $class, %args ) =  @_;
		
	bless{
		    name             => $args{'name'},
		    start_bankroll   => $args{'bankroll'},
		    current_bankroll => $args{'bankroll'},
		    method           => $args{'method'},
		    history          => _initialize_history( $args{'history'} ),
	}, $class;
}

sub name{
  my ( $self ) = @_;
  return $self->{'name'};
}

sub log_result{
  my ( $self, %args ) = @_;
  
  my $pre_bankroll = $self->{'current_bankroll'};
  
  my $bet = _get_bet( $self );
  return if $bet == 0; # Our bankroll is depleted
  
  if(     $args{'result'} == 1 ){  $self->{'current_bankroll'} += $bet;
  }elsif( $args{'result'} == 0 ){  $self->{'current_bankroll'} -= $bet;
  }else{
    # Do nothing, we have a bad result
  }
  
  my %history_entry = ( bet => $bet, result => $args{'result'}, pre_bankroll => $pre_bankroll, post_bankroll => $self->{'current_bankroll'} );
  push @{$self->{'history'}}, \%history_entry;
}

sub report{
  my ( $self ) = @_;
  
  my %status = ( name             => $self->{'name'},
                 bankroll_start   => $self->{'start_bankroll'},
                 bankroll_current => $self->{'current_bankroll'},
                 betting_method   => $self->{'method'}->name(),
                 history          => $self->{'history'},
               );

  return \%status;  
}

sub _get_bet{
  my ( $self, %args ) = @_;  
  my $bet = $self->{'method'}->get_bet( bankroll => $self->{'current_bankroll'},
                                        history  => $self->{'history'},
                                      );
  return $bet;
}

sub _initialize_history{
  my ( $prior_history ) = @_;
  my @history;
  return \@history;
}

=head1 NAME

Games::Bettor - A class representing a bettor

=head1 VERSION

Version 1.0

=cut

our $VERSION = '1.00';

=head1 SYNOPSIS

This class represents an individual bettor with a name, bankroll, betting method and history.

Perhaps a little code snippet.

    use Games::Bettor;

    my $bettor = Games::Bettor->new( name => 'Connie', 
                                     bankroll => 1000, 
                                     method => Games::Bettor::Consistent->new( amount => 1 )
                                   );

=head1 METHODS

=head2 new

  $bettor = Games::Bettor->new( name     => $string,
                                bankroll => $number,
                                method   => $ref_to_method
                              );
  
  Returns a new Bettor object.
  
  name: A human readable designation for this object.
  bankroll: The starting bankroll for this bettor.
  method: a reference to the betting method to use.

=head2 name

  my $name= $bettor->name();
  
  Returns the name associated with the Bettor object;

=head2 log_result

  $bettor->log_result( result => [0|1] );
  
  Alerts the Bettor object to the outcome of a paricular trial.

=head2 report

  my $bettor_data = $bettor->report();
    
  Returns a hash reference containing data on the run for a particular Bettor object.  The data points
  returned are name, starting bankroll, ending bankroll and the trial history.


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

    perldoc Games::Bettor

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

=head1 COPYRIGHT & LICENSE

Copyright 2006 Troy Denkinger, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Games::Bettor
