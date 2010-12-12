package NRPM::Web::Controller::Treffen;
# ABSTRACT: Treffen Controller for NRPM::Web
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => 'treffen');

=head1 DESCRIPTION

Treffen Controller

=cut

sub base :Chained('/base') :PathPart('treffen') :CaptureArgs(0) {
    my ( $self, $c ) = @_;
}

sub index :Chained('base') :PathPart('') :Args(0) {
	my ( $self, $c ) = @_;
	$c->stash->{title} = 'Treffen der Perl Mongers im Niederrhein';
	$c->stash->{all_treffen} = $c->model('NRPM')->treffen;
}

sub view :Chained('base') :PathPart('') :Args(1) {
	my ( $self, $c, $name ) = @_;
	$c->stash->{treffen} = $c->model('NRPM')->treffen($name);
	$c->stash->{title} = 'Treffen: '.$c->stash->{treffen}->{title};
}

__PACKAGE__->meta->make_immutable;

1;
