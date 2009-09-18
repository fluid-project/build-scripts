#!/bin/bash
source /home/flexibus/scripts/fluid/fluid_tomcat_env.sh
INCUBATOR_WORKING_COPY=/home/flexibus/continuum/working/46
INCUBATOR_WEBAPP=$CATALINA_HOME/webapps/incubator

# cleanup and create webapp directory
rm -rf $INCUBATOR_WEBAPP 
mkdir $INCUBATOR_WEBAPP

# get fluid_all and put the contents in the root of the incubator
svn co http://source.fluidproject.org/svn/fluid/fluid-all
mv $INCUBATOR_WORKING_COPY/fluid-all/* $INCUBATOR_WORKING_COPY
rm -rf $INCUBATOR_WORKING_COPY/fluid-all 

# copy everything to the webapp directory
cp -r $INCUBATOR_WORKING_COPY/* $INCUBATOR_WEBAPP 
