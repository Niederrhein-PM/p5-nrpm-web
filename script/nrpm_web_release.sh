#!/bin/bash

CURRENT_DATE_FILENAME=$( date +%Y%m%d_%H%M%S )

ssh nrpm@niederrhein.pm.org "(
	rm -rf ~/deploy/p5-nrpm-web &&
	mkdir ~/deploy/p5-nrpm-web
)"
scp $1 nrpm@niederrhein.pm.org:~/deploy/p5-nrpm-web
ssh -t nrpm@niederrhein.pm.org "(
	eval \$(perl -I\$HOME/perl5/lib/perl5 -Mlocal::lib) &&
	cd ~/deploy/p5-nrpm-web &&
	tar xz --strip-components=1 -f $1 &&
	rm $1 && script/nrpm_web_deploy.sh
)"
