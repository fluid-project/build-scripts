#!/bin/bash
CONTINUUM_ENGAGE_PROJECT=/home/flexibus/continuum/working/56

# rebuild and redeploy the fluid components 
cd $CONTINUUM_ENGAGE_PROJECT/kettle/build-scripts
ant

# copy the war file to tomcat and remove the old code
cp $CONTINUUM_ENGAGE_PROJECT/kettle/build/war/target/*.war $CATALINA_HOME/webapps/engage.war
rm -rf $CATALINA_HOME/webapps/engage

