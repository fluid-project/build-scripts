#!/bin/bash
source /home/flexibus/scripts/fluid/fluid_tomcat_env.sh
MTP_WORKING_COPY=/home/flexibus/continuum/working/50
MTP_WEBAPP=$CATALINA_HOME/webapps/incubator/mobiledesigntestingplatform

rm -rf $MTP_WEBAPP 
mkdir $MTP_WEBAPP
cp -r $MTP_WORKING_COPY/* $MTP_WEBAPP 
