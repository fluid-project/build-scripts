#!/bin/sh

source /home/flexibus/scripts/uploader-server/uploader-server-env.sh
cd $UPLOADER_SERVER_HOME/image-gallery/web
mvn clean install war:inplace jetty:run &
echo $!>$JETTY_PID

