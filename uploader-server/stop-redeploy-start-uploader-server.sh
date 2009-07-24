#!/bin/sh

check_errs()
{
  # Function. Parameter 1 is the return code
  # Para. 2 is text to display on failure.
  if [ "${1}" -ne "0" ]; then
    echo "ERROR # ${1} : ${2}"
    exit ${1}
  fi
}

source /home/flexibus/scripts/uploader-server/uploader-server-env.sh

/home/flexibus/scripts/uploader-server/stop-uploader-server.sh

# Delete the old log.
rm /home/flexibus/scripts/uploader-server/uploader-jetty.log

# Delete the exploded fluid-components war.
cd $UPLOADER_SERVER_HOME/image-gallery/web/src/main/webapp
rm -rf components
rm -rf framework
rm -rf integration-demos
rm -rf lib
rm -rf sample-code
rm -rf standalone-demos
rm -rf tests

# Rebuild.
cd $UPLOADER_SERVER_HOME/master
mvn clean install
check_errs $?  "error building the sakai master plugin."

cd $UPLOADER_SERVER_HOME/fluid-components
mvn clean install
check_errs $?  "error building Fluid Infusion."

cd $UPLOADER_SERVER_HOME/image-gallery
mvn clean install sakai:deploy -Dmaven.tomcat.home=$UPLOADER_SERVER_HOME
check_errs $?  "error building and deploying the app."

# Start.
cd $UPLOADER_SERVER_SCRIPTS
/home/flexibus/scripts/uploader-server/start-uploader-server.sh  >& ./uploader-jetty.log 
check_errs $?  "error restarting jetty."

