The Scripts
-----------

stop_deploy_resetdb_start.sh
- stops sakai and tomcat if running
- restores the database to a clean state with the Gallery tool included.
- redeploy everything
- restarts sakai
- invoked by nightly cron job

fluid_sakai_backup.sql
- a clean mysql dump of the sakai_fluid_db database including deployment of the Gallery tool and a single image.
- created by the mysqldump command described above

sakai_start_tomcat.sh
- starts sakai. 
- Called by reset_fluid_sakai_db.sh

sakai_stop_tomcat.sh
- stops sakai and then terminates the associated java process to ensure it does not block restoring the database.
- invoked by reset_fluid_sakai_db.sh

sakai_tomcat_env.sh
- constants used in scripts including $CATALINA_HOME



How to Create a Image of the Database
-----------

To create a copy of the database execute:
   mysqldump -u fluid_db_user sakai_fluid_db > somefilename.sql


