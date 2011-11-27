#!/bin/bash

CURRENT_DATE_FILENAME=$( date +%Y%m%d_%H%M%S )

if [ ! -d ~/deploy/p5-nrpm-web ]
then
	echo "ERROR: nothing to deploy..."
	exit 1
fi

#
#
#
echo -n "Restarting nrpm.web.deploy service... "
svc -du /etc/service/nrpm.web.deploy && \
echo "done"

#
#
#
echo -n "Waiting 5 seconds... "
sleep 5 && \
echo "done"

#
#
#
echo "Checking if the processes are running..."
PROCMANAGER_CHECK="0"
DEPLOY_PID=$( cat ~/prod/nrpm.web.deploy.pid )
CHILD_COUNT="0"
for PID in $( fuser ~/prod/nrpm.web.deploy.socket 2>&1 | cut -f2- -d: )
do
	echo -n "$PID "
	if [ "$PID" == "$DEPLOY_PID" ]
	then
		echo "procmanager"
		PROCMANAGER_CHECK="1"
	else
		echo "child"
		CHILD_COUNT=$(( $CHILD_COUNT+1 ))
	fi
done

#
#
#
if [ "$CHILD_COUNT" == "0" ]
then
	echo "ERROR: cant find any childs accessing the socket"
	svc -d /etc/service/nrpm.web.deploy
	exit 1
fi

#
#
#
if [ "$PROCMANAGER_CHECK" == "0" ]
then
	echo "ERROR: cant find procmanager running on socket! breaking up deploy"
	svc -d /etc/service/nrpm.web.deploy
	exit 1
fi

#
#
#
echo -n "Stopping nrpm.web service... "
svc -d /etc/service/nrpm.web && \
echo "done"

#
#
#
echo -n "Backup of old production... "
mv ~/prod/p5-nrpm-web ~/backup/p5-nrpm-web-$CURRENT_DATE_FILENAME && \
cp -ar ~/deploy/p5-nrpm-web ~/prod/p5-nrpm-web && \
cd ~/prod/p5-nrpm-web && \
echo "done"

#
#
#
echo -n "Starting nrpm.web service... "
svc -u /etc/service/nrpm.web && \
echo "done"

#
#
#
echo -n "Waiting 5 seconds... "
sleep 5 && \
echo "done"

#
#
#
echo -n "Stopping nrpm.web.deploy service... "
svc -d /etc/service/nrpm.web.deploy && \
echo "done"
