package NRPM::Web::Controller::Root;
# ABSTRACT: Root Controller for NRPM::Web
use Moose;
use namespace::autoclean;
use utf8;

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
	
	my %old_urls = (
		'region/region.html' => $c->uri_for('region'),
		'links/links.html' => $c->uri_for('links'),
		'links/book.html' => $c->uri_for('links'),
		'links/binary.html' => $c->uri_for('links'),
		'links/editors.html' => $c->uri_for('links'),
		'links/tutorial.html' => $c->uri_for('links'),
		'talks/talks.html' => $c->uri_for(''),
		'talks/col.html' => $c->uri_for(''),
		'talks/col.html' => $c->uri_for(''),
		'treffen/treffen.html' => $c->uri_for('treffen'),
		'treffen/200101de.html' => $c->uri_for('treffen/20010118'),
		'treffen/200102de.html' => $c->uri_for('treffen/20010216'),
		'treffen/200111de.html' => $c->uri_for('treffen/20011100'),
		'treffen/200201de.html' => $c->uri_for('treffen/20020100'),
		'treffen/200202de.html' => $c->uri_for('treffen/20020221'),
	);
	
	return $c->response->redirect($old_urls{$c->req->path}, 301) if ($old_urls{$c->req->path});
	
	$c->stash->{title} = 'Nicht gefunden!';
    $c->response->status(404);
}

sub impressum :Chained('base') :Args(0) {
	my ( $self, $c ) = @_;
	$c->stash->{title} = 'Impressum';
}

sub links :Chained('base') :Args(0) {
	my ( $self, $c ) = @_;
	$c->stash->{title} = 'Empfohlene Links';
}

sub region :Chained('base') :Args(0) {
	my ( $self, $c ) = @_;
	$c->stash->{title} = 'Die Region die unsere Perl Mongers Gruppe einschliesst';
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;
