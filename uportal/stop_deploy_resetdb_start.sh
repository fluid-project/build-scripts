#!/bin/bash
source /home/flexibus/scripts/uportal/uportal_tomcat_env.sh

# shut tomcat down
echo "Step 1: shutdown tomcat"
/home/flexibus/scripts/uportal/uportal_stop_tomcat.sh  >& /dev/null
check_errs $?  "error stopping tomcat."

echo "Step 2: reset hsql database"
# shut hsql down
/home/flexibus/scripts/uportal/stop_hsql.sh  >& /dev/null
check_errs $?  "error stopping hsql."

# reset the database to known state
/home/flexibus/scripts/uportal/reset_hsql.sh  >& /dev/null
check_errs $?  "error reset hsql."

# restart hsql
/home/flexibus/scripts/uportal/start_hsql.sh  >& /dev/null
check_errs $?  "error restarting hsql."

# update uportal to the trunk
echo "Step 3: update uportal to the trunk"
/home/flexibus/scripts/uportal/uportal_update_to_trunk.sh
check_errs $?  "error update uportal to trunk."

# rebuild and install components and gallery tool
echo "Step 4: rebuild and install components and gallery tool"
cd $CONTINUUM_PORTLET_PROJECT
mvn clean install
check_errs $?  "portlet failed to rebuild and redeploy."

# redeploy the portlet
# copy the war file to an unversioned filename first, since apache needs
# to map the path to right worker in httpd.conf, and we don't want
# to have to restart apache for every new version
# (see FLUID-41)
cd $CONTINUUM_PORTLET_PROJECT/gallery-portlet/target/
cp gallery-portlet-*.war gallery-portlet.war
cd $UPORTAL_HOME
ant-1.65 deployPortletApp -DportletApp=$CONTINUUM_PORTLET_PROJECT/gallery-portlet/target/gallery-portlet.war

# restart tomcat
echo "Step 5: restart tomcat"
/home/flexibus/scripts/uportal/uportal_start_tomcat.sh >& /dev/null
check_errs $?  "error starting tomcat."

