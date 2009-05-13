#!/bin/bash
source /home/flexibus/scripts/fluid/fluid_tomcat_env.sh
CONTINUUM_GALLERY_PROJECT=/home/flexibus/continuum/working/36

check_errs()
{
  # Function. Parameter 1 is the return code
  # Para. 2 is text to display on failure.
  if [ "${1}" -ne "0" ]; then
    echo "ERROR # ${1} : ${2}"
    exit ${1}
  fi
}

# shut tomcat down
/home/flexibus/scripts/fluid/fluid_stop_tomcat.sh 
check_errs $?  "error stopping tomcat."

# rebuild and redeploy the fluid components 
cd $CONTINUUM_GALLERY_PROJECT/build-scripts
ant dailyBuild
check_errs $?  "error rebuilding"

# copy the war fiel to tomcat and remove the old code
cp $CONTINUUM_GALLERY_PROJECT/products/dist/fluid-components*.war $CATALINA_HOME/webapps/infusion.war
rm -rf $CATALINA_HOME/webapps/infusion
check_errs $?  "error redeploying."

# restart tomcat
/home/flexibus/scripts/fluid/fluid_start_tomcat.sh 
check_errs $?  "error starting tomcat."

