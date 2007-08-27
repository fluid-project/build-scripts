#!/bin/bash
source /home/flexibus/scripts/uportal/uportal_tomcat_env.sh
UPORTAL_HOME=/home/flexibus/source/uPortal
UPORTAL_TOMCAT=/home/flexibus/uportal_tomcat
CONTINUUM_PORTLET_PROJECT=/home/flexibus/continuum/working/34
HSQL_HOME=/home/flexibus/bin/hsqldb_1-8-0-7

check_errs()
{
  # Function. Parameter 1 is the return code
  # Para. 2 is text to display on failure.
  if [ "${1}" -ne "0" ]; then
    echo "ERROR # ${1} : ${2}"
    if [ "${1}" -ne "10" ]; then
      exit ${1}
    fi
  fi
}

# shut tomcat down
/home/flexibus/scripts/uportal/uportal_stop_tomcat.sh
check_errs $?  "error stopping tomcat."

# shut hsql down
java -jar $HSQL_HOME/lib/hsqldb.jar --sql shutdown localhost-sa
check_errs $?  "error stopping hsql."

# reset the database to known state
rm -rf $UPORTAL_HOME/data
cp -r /home/flexibus/scripts/uportal/hsql-data $UPORTAL_HOME/data

# restart hsql
/home/flexibus/scripts/uportal/start_hsql.sh  >& /dev/null
check_errs $?  "error restarting hsql."

# rebuild and install components and gallery tool
cd $CONTINUUM_PORTLET_PROJECT
mvn clean install
check_errs $?  "portlet failed to rebuild and redeploy."

cd gallery-portlet
mvn -Dappserver.id=tomcat5x -Dappserver.home=$UPORTAL_TOMCAT cargo:deploy
check_errs $?  "portlet failed to rebuild and redeploy."

# redeploy the portlet
cd $UPORTAL_HOME
ant deployPortletApp -DportletApp=$UPORTAL_TOMCAT/webapps/gallery-portlet-0.1.war


# restart tomcat
/home/flexibus/scripts/uportal/uportal_start_tomcat.sh 
check_errs $?  "error starting tomcat."

