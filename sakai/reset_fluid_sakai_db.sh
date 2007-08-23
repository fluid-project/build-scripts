#! /bin/bash -l

#stop tomcat
/home/flexibus/scripts/sakai/sakai_stop_tomcat.sh

#reset sakai database to known state
mysql -u fluid_db_user sakai_fluid_db < /home/flexibus/scripts/sakai/fluid_sakai_backup.sql

# restart tomcat
/home/flexibus/scripts/sakai/sakai_start_tomcat.sh

