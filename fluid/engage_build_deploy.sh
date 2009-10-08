#!/bin/bash
source /home/flexibus/scripts/fluid/fluid_tomcat_env.sh
CONTINUUM_ENGAGE_PROJECT=/home/flexibus/continuum/working/56

# check errors also exists in stop_deploy_start.sh and should be refactored
check_errs()
{
  # Function. Parameter 1 is the return code
  # Para. 2 is text to display on failure.
  if [ "${1}" -ne "0" ]; then
    echo "ERROR # ${1} : ${2}"
    exit ${1}
  fi
}

# rebuild engage with ant
cd $CONTINUUM_ENGAGE_PROJECT/kettle/build-scripts
ant
check_errs $? "ant build failed"

# copy the war file to tomcat and remove the old code
cp $CONTINUUM_ENGAGE_PROJECT/kettle/build/war/target/*.war $CATALINA_HOME/webapps/engage.war
check_errs $? "copy WAR failed"

rm -rf $CATALINA_HOME/webapps/engage

