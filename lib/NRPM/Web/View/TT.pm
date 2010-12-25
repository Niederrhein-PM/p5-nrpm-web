package NRPM::Web::View::TT;
# ABSTRACT: NRPM-Web Template Toolkit View
use Moose;

extends 'Catalyst::View::TT';

use Template::Stash::XS;

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
	INCLUDE_PATH => [
		NRPM::Web->path_to( 'templates' ),
	],
	PLUGIN_BASE => 'NRPM::Web::Template::Plugin',
	START_TAG => '<@',
	END_TAG => '@>',
	PRE_PROCESS => 'macros.tt',
	WRAPPER => 'base.tt',
	ENCODING => 'utf-8',
	COMPILE_DIR => "/tmp/nrpm_web_template_cache_$<",
	STASH => Template::Stash::XS->new,
);

__PACKAGE__->meta->make_immutable( inline_constructor => 0 );

1;
