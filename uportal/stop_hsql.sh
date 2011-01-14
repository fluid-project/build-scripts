#!/bin/bash
source /home/flexibus/scripts/uportal/uportal_tomcat_env.sh

cd $UPORTAL_HOME

# for some reason ant hsql-shutdown fails, but calling hsqldb with the same parameters is successful, so commented this out
#/home/flexibus/bin/apache-ant-1.7.1/bin/ant hsql-shutdown

java -Xmx8M -classpath /home/flexibus/.m2/repository/hsqldb/hsqldb/1.8.0.10/hsqldb-1.8.0.10.jar org.hsqldb.util.SqlTool --rcFile /home/flexibus/source/uPortal/trunk/bootstrap/hsqldb.sqltool.rc --sql "SHUTDOWN compact;" uPortalDb
