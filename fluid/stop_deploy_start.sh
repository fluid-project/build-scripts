#!/bin/bash
source /home/flexibus/scripts/fluid/fluid_tomcat_env.sh
CONTINUUM_GALLERY_PROJECT=/home/flexibus/continuum/working/36

# shut tomcat down
/home/flexibus/scripts/fluid/fluid_stop_tomcat.sh 
check_errs $?  "error stopping tomcat."

# rebuild and redeploy the fluid components 
cd $CONTINUUM_GALLERY_PROJECT/build-scripts
ant dailyBuild
check_errs $?  "error rebuilding"

# copy the war fiel to tomcat and remove the old code
cp $CONTINUUM_GALLERY_PROJECT/products/src-dist/fluid-components*.war $CATALINA_HOME/webapps/infusion.war
rm -rf $CATALINA_HOME/webapps/infusion
check_errs $?  "error redeploying."

# restart tomcat
/home/flexibus/scripts/fluid/fluid_start_tomcat.sh 
check_errs $?  "error starting tomcat."

