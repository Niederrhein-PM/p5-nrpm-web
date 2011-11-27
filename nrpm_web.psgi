use strict;
use warnings;

use NRPM::Web;
use Plack::Builder;

my $app = NRPM::Web->apply_default_middlewares(NRPM::Web->psgi_app);

builder {
	#enable 'Debug', panels => [ qw(CatalystLog DBITrace Memory Timer Parameters Session Response) ];
	$app;
};
