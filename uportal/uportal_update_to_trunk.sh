#!/bin/bash
source /home/flexibus/scripts/uportal/uportal_tomcat_env.sh

cd $UPORTAL_HOME
echo `pwd`
svn update
check_errs $?  "error doing svn update on uportal trunk."
ant clean initportal
check_errs $?  "error doing ant deploy-ear."
