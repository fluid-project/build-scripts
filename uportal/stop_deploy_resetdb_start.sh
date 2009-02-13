#!/bin/bash
source /home/flexibus/scripts/uportal/uportal_tomcat_env.sh

# shut tomcat down
echo "Step 1: shutdown tomcat"
/home/flexibus/scripts/uportal/uportal_stop_tomcat.sh  >& /dev/null
check_errs $?  "error stopping tomcat."

echo "Step 2: reset hsql database"
# shut hsql down
/home/flexibus/scripts/uportal/stop_hsql.sh  >& /dev/null
check_errs $?  "error stopping hsql."

# reset the database to known state
/home/flexibus/scripts/uportal/reset_hsql.sh  >& /dev/null
check_errs $?  "error reset hsql."

# restart hsql
/home/flexibus/scripts/uportal/start_hsql.sh  >& /dev/null
check_errs $?  "error restarting hsql."

# update uportal to the trunk
echo "Step 3: update uportal to the trunk"
/home/flexibus/scripts/uportal/uportal_update_to_trunk.sh
check_errs $?  "error update uportal to trunk."

# restart tomcat
echo "Step 5: restart tomcat"
/home/flexibus/scripts/uportal/uportal_start_tomcat.sh >& /dev/null
check_errs $?  "error starting tomcat."

