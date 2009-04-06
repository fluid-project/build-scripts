#!/bin/sh

source /home/flexibus/scripts/uploader-server/uploader-server-env.sh
pid=`cat $JETTY_PID`
kill $pid
