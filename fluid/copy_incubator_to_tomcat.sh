#!/bin/bash
source /home/flexibus/scripts/fluid/fluid_tomcat_env.sh
INCUBATOR_WORKING_COPY=/home/flexibus/continuum/working/46
INCUBATOR_WEBAPP=$CATALINA_HOME/webapps/incubator

rm -rf $INCUBATOR_WEBAPP 
mkdir $INCUBATOR_WEBAPP
cp -r $INCUBATOR_WORKING_COPY/* $INCUBATOR_WEBAPP 
