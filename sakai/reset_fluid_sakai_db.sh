#! /bin/bash -l

SAKAI_TOMCAT=/home/flexibus/sakai_tomcat/
CONTINUUM_GALLERY_PROJECT=/home/flexibus/continuum/working/12

/home/flexibus/scripts/sakai/sakai_stop_tomcat.sh
mysql -u fluid_db_user sakai_fluid_db < /home/flexibus/scripts/sakai/fluid_sakai_backup.sql
cd $CONTINUUM_GALLERY_PROJECT
maven sakai -Dmaven.tomcat.home=$SAKAI_TOMCAT
/home/flexibus/scripts/sakai/sakai_start_tomcat.sh

