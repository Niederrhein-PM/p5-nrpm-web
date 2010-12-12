package NRPM::Web;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use Catalyst qw/
    ConfigLoader
    Static::Simple
	Unicode::Encoding
/;

extends 'Catalyst';

our $VERSION = '0.01';
$VERSION = eval $VERSION;

__PACKAGE__->config(
    name => 'NRPM::Web',
    disable_component_resolution_regex_fallback => 1,
);

# Start the application
__PACKAGE__->setup();


=head1 NAME

NRPM::Web - Niederrhein Perl Monger Web application for L<http://niederrhein.pm.org>

=head1 SYNOPSIS

    script/nrpm_web_server.pl

=head1 DESCRIPTION

This is the web application which is used by the NiederheinPM for running L<http://niederrhein.pm.org>

=head1 SEE ALSO

L<NRPM::Web::Controller::Root>, L<Catalyst>

=cut

1;
