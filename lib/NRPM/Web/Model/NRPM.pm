package NRPM::Web::Model::NRPM;
use Moose;
use namespace::autoclean;

extends 'Catalyst::Model';

use IO::All -utf8;
use YAML qw(LoadFile);

sub treffen {
	my ( $self, $name ) = @_;
	
	return $self->get_treffen_data($name) if ($name);
	
	my $treffen_io = io(NRPM::Web->path_to( 'data', 'treffen' ));
	my @all_treffen;
	for (sort {$b <=> $a} keys %$treffen_io) {
		push @all_treffen, $self->get_treffen_data($_);
	}
	return \@all_treffen;
}

sub get_treffen_data {
	my ( $self, $name ) = @_;
	my $data_yml = NRPM::Web->path_to( 'data', 'treffen', $name, 'data.yml' );
	my $data_html = NRPM::Web->path_to( 'data', 'treffen', $name, 'data.html' );
	if (-f $data_yml) {
		my $treffen = LoadFile($data_yml);
		$treffen->{key} = $name;
		if (-f $data_html) {
			$treffen->{html} = io($data_html)->slurp;
		}
		return $treffen;
	}
}

1;
