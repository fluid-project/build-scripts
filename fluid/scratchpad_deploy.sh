#!/bin/bash
source /home/flexibus/scripts/fluid/fluid_tomcat_env.sh
SCRATCHPAD_WORKING_COPY=/home/flexibus/continuum/working/51
SCRATCHPAD_WEBAPP=$CATALINA_HOME/webapps/scratchpad

# cleanup and create webapp directory
rm -rf $SCRATCHPAD_WEBAPP 
mkdir $SCRATCHPAD_WEBAPP

# get fluid_all and put the contents in the root of the scratchpad
svn co http://source.fluidproject.org/svn/fluid/fluid-all
mv $SCRATCHPAD_WORKING_COPY/fluid-all/* $SCRATCHPAD_WORKING_COPY
rm -rf $SCRATCHPAD_WORKING_COPY/fluid-all 

# copy everything to the webapp directory
cp -r $SCRATCHPAD_WORKING_COPY/* $SCRATCHPAD_WEBAPP 
