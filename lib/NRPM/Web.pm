package NRPM::Web;
# ABSTRACT: Niederrhein Perl Monger Web application for L<http://niederrhein.pm.org>
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use Catalyst qw/
    Static::Simple
	Unicode::Encoding
/;

extends 'Catalyst';

__PACKAGE__->config(
    name => 'NRPM::Web',
    disable_component_resolution_regex_fallback => 1,
	encoding => 'UTF-8',
);

# Start the application
__PACKAGE__->setup();


=head1 SYNOPSIS

    script/nrpm_web_server.pl

=head1 DESCRIPTION

This is the web application which is used by the NiederheinPM for running L<http://niederrhein.pm.org>

=head1 SEE ALSO

L<NRPM::Web::Controller::Root>, L<Catalyst>

=cut

1;
