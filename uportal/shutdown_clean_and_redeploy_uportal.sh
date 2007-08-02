#! /bin/bash -l

UPORTAL_HOME=/home/flexibus/source/uPortal
HSQL_HOME=/home/flexibus/bin/hsqldb_1-8-0-7

/home/flexibus/scripts/uportal/uportal_stop_tomcat.sh

java -jar $HSQL_HOME/lib/hsqldb.jar --sql shutdown localhost-sa

rm -rf $UPORTAL_HOME/data
cp -r /home/flexibus/scripts/uportal//hsql-data $UPORTAL_HOME/data

/home/flexibus/scripts/uportal/start_hsql.sh  >& /dev/null

/home/flexibus/scripts/uportal/deploy_gallery_portlet.sh

/home/flexibus/scripts/uportal/uportal_start_tomcat.sh

