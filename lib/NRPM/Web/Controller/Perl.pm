package NRPM::Web::Controller::Perl;
# ABSTRACT: Perl Controller for NRPM::Web
use Moose;
use namespace::autoclean;
use utf8;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => 'perl');

=head1 DESCRIPTION

Perl Controller

=cut

sub base :Chained('/base') :PathPart('perl') :CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub index :Chained('base') :PathPart('') :Args(0) {
	my ( $self, $c ) = @_;
	$c->stash->{title} = 'Perl Aktivitäten der niederrhein.pm Mitglieder';
}

use Data::Dumper;

sub cpan :Chained('base') :Args(0) {
	my ( $self, $c, $name ) = @_;
	$c->stash->{title} = 'CPAN Distributionen hochgeladen von niederrhein.pm Mitgliedern';
	$c->stash->{all_distributions} = $c->model('NRPM')->distributions;
}

__PACKAGE__->meta->make_immutable;

1;
