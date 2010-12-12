package NRPM::Web::Controller::Root;
# ABSTRACT: Root Controller for NRPM::Web
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

=head1 DESCRIPTION

Root Controller

=cut

sub base :Chained('/') :PathPart('') :CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub index :Chained('base') :PathPart('') :Args(0) {
	my ( $self, $c ) = @_;
	$c->stash->{title} = 'Willkommen bei den Perl Mongers im Niederrhein';
}

sub default :Chained('base') :PathPart('') :Args {
    my ( $self, $c ) = @_;
	$c->stash->{title} = 'Hups, haben wir nicht gefunden';
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;
