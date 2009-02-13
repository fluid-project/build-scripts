#!/bin/bash
source /home/flexibus/scripts/uportal/uportal_tomcat_env.sh

catalina_pid=`cat $CATALINA_PID`
timeout=60
sleeptime=1
waited=0

$CATALINA_HOME/bin/catalina.sh stop

while [ -n "`ps --pid $catalina_pid --no-headers`" ] \
			&& [ $waited -lt $timeout ] ; do
	sleep $sleeptime
	waited=$((waited + sleeptime))
done

if [ -n "`ps --pid $catalina_pid --no-headers`" ] ; then
        kill -9 $catalina_pid
fi

