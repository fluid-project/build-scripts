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

source /home/continuum/scripts/uploader-server/uploader-server-env.sh

$UPLOADER_SERVER_SCRIPTS/stop-uploader-server.sh

# Delete the old log.
rm $UPLOADER_SERVER_SCRIPTS/uploader-jetty.log

# Delete the exploded fluid-components war.
cd $UPLOADER_SERVER_HOME/web/src/main/webapp
rm -rf components
rm -rf framework
rm -rf integration-demos
rm -rf lib
rm -rf sample-code
rm -rf standalone-demos
rm -rf tests

# Rebuild.
cd $UPLOADER_SERVER_HOME

#rm -rf sakai-master
#git clone https://github.com/fluid-project/sakai-master.git sakai-master
#cd sakai-master
git clone https://github.com/fluid-project/image-gallery2.git image-gallery
git clone https://github.com/fluid-project/infusion.git fluid-components

mvn clean install sakai:deploy -Dmaven.tomcat.home=$UPLOADER_TOMCAT_HOME
check_errs $?  "error building and deploying the app."

# Start.
cd $UPLOADER_SERVER_SCRIPTS
./start-uploader-server.sh  >& ./uploader-jetty.log 
check_errs $?  "error restarting jetty."

