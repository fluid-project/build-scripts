#!/bin/bash
source /home/flexibus/scripts/fluid/fluid_tomcat_env.sh
REPORT_WORKING_COPY=/home/flexibus/continuum/working/49
REPORT_WEBAPP=$CATALINA_HOME/webapps/finalreport

rm -rf $REPORT_WEBAPP 
mkdir $REPORT_WEBAPP
cp -r $REPORT_WORKING_COPY/* $REPORT_WEBAPP 
