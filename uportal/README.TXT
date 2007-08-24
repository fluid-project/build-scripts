The Scripts
-----------

stop_deploy_resetdb_start.sh
- stops tomcat
- shuts hsqldb down
- replaces the uPortal database
- restarts hsql
- rebuild
- deploys the gallery-portlet to uportal's tomcat
- restarts tomcat
- invoked by nightly continuum goal

start_hsql.sh
- invokes the uPortal ant target to launch hsqldb (which doesn't return)
- used by shutdown_clean_and_redeploy_uportal_absolute_paths.sh

uportal_stop_tomcat.sh
- stops uportal's tomcat instance
- used by shutdown_clean_and_redeploy_uportal.sh

uportal_start_tomcat.sh
- starts uportal's tomcat instance
- used by shutdown_clean_and_redeploy_uportal.sh

uportal_tomcat_env.sh
- environment variables used by the other scripts in this folder


Database
--------

hsql-data
- this is a copy of the uPortal database ($UPORTAL_HOME/data) that is used to reset the database to a known state once per day
- used by reset_hsql_database.sh

