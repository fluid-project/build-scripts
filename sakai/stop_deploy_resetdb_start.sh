#!/bin/bash
source /home/flexibus/scripts/sakai/sakai_tomcat_env.sh
CONTINUUM_GALLERY_PROJECT=/home/flexibus/continuum/working/33

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
/home/flexibus/scripts/sakai/sakai_stop_tomcat.sh 
check_errs $?  "error stopping tomcat."

# rebuild and redeploy the fluid components and gallery tool
cd $CONTINUUM_GALLERY_PROJECT
mvn -Dmaven.test.skip clean install
check_errs $?  "error rebuilding"
mvn -Dmaven.tomcat.home=$CATALINA_HOME -Dmaven.test.skip sakai:deploy
check_errs $?  "error redeploying."

# reset the database to known state
mysql -u fluid_db_user sakai_fluid_db < /home/flexibus/scripts/sakai/fluid_sakai_backup.sql
check_errs $?  "error resetting the database."

# restart tomcat
/home/flexibus/scripts/sakai/sakai_start_tomcat.sh 
check_errs $?  "error starting tomcat."

