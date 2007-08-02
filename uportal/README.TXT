The Scripts
-----------

shutdown_clean_and_redeploy_uportal.sh
- stops tomcat
- shuts hsqldb down
- replaces the uPortal database
- restarts hsql
- deploys the gallery-portlet to uportal's tomcat
- restarts tomcat
- invoked by nightly cron job

start_hsql.sh
- invokes the uPortal ant target to launch hsqldb (which doesn't return)
- used by shutdown_clean_and_redeploy_uportal_absolute_paths.sh

deploy_gallery_portlet.sh
- builds fluid-components, gallery and gallery-portlet
- deploys the portlet to uportal's tomcat 
- used by the nightly tomcat reset

build_hourly_gallery_portlet.sh
- builds fluid-components, gallery and gallery-portlet
- deploys to maven repoository, but not tomcat 
- directly invoked by the hourly continuum build

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

