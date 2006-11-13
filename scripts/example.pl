#!/usr/bin/perl

use warnings;
use strict;
use lib('./lib');
use Data::Dumper;

use constant TRIALS => 1_000;
use constant BIAS   => .10;
use constant ODDS   => 1;

use Games::FlipCoin;
use Games::Bettor;
use Games::Bettor::Consistent;
use Games::Bettor::Martingale;
use Games::Bettor::Kelly;
use Games::Bettor::Reckless;

my $martin = Games::Bettor->new( name => 'Martin', 
                                 bankroll => 1000, 
                                 method => Games::Bettor::Martingale->new( amount => 1 ),
                               );

my $connie = Games::Bettor->new( name => 'Connie', 
                                 bankroll => 1000, 
                                 method => Games::Bettor::Consistent->new( amount => 1 ),
                               );
                               
my $kelly = Games::Bettor->new( name => 'Kelly',
                                bankroll => 1000,
                                method => Games::Bettor::Kelly->new( winner => 50 + BIAS * 100, odds => ODDS ),
                              );
                              
my $becky = Games::Bettor->new( name => 'Becky',
                                bankroll => 1000,
                                method => Games::Bettor::Reckless->new(),
                              );                               
                                                             
                               
my $max_trials = TRIALS;
my $win_count = 0;
for( my $trials = 1; $trials <= $max_trials; $trials++ ){

  my $flip = flip( bias => BIAS );
  
  $win_count++ if $flip == 1;

  $martin->log_result( result => $flip );  
  $connie->log_result( result => $flip );  
  $kelly->log_result( result => $flip );
  $becky->log_result( result => $flip );  

}

foreach( $martin, $connie, $kelly, $becky ){
  my $status = $_->report();
  print $status->{'name'}, " (", $status->{'betting_method'}, ")\n";
  print "Starting: ", $status->{'bankroll_start'}, "\n";
  print "Current: ", $status->{'bankroll_current'}, "\n";
#  print Dumper $status->{'history'}, "\n" if $status->{'name'} eq 'Becky';
  print "\n";
  
}