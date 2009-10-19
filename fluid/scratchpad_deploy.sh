#!/bin/bash
source /home/flexibus/scripts/fluid/fluid_tomcat_env.sh
SCRATCHPAD_WORKING_COPY=/home/flexibus/continuum/working/51
SCRATCHPAD_WEBAPP=$CATALINA_HOME/webapps/scratchpad

# cleanup and create webapp directory
rm -rf $SCRATCHPAD_WEBAPP 
mkdir $SCRATCHPAD_WEBAPP
check_errs  $?  "error removing old webapp and creating new folder"

# get fluid_all and put the contents in the root of the scratchpad
svn co http://source.fluidproject.org/svn/fluid/fluid-all
check_errs  $?  "error checking out fluid-all"

cp -rf $SCRATCHPAD_WORKING_COPY/fluid-all/* $SCRATCHPAD_WORKING_COPY
check_errs  $?  "error copying fluid-all/* to working copy folder"

rm -rf $SCRATCHPAD_WORKING_COPY/fluid-all 
check_errs  $?  "error removing fluid-all"

# copy everything to the webapp directory
cp -r $SCRATCHPAD_WORKING_COPY/* $SCRATCHPAD_WEBAPP 
check_errs  $?  "error copying working copy to webapp"
