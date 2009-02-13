#!/bin/bash
source /home/flexibus/scripts/uportal/uportal_tomcat_env.sh

## Right now Feb. 13, 2009), uPortal is not set up properly
## (i.e. no gallery portlet, no Announements  portlet) so we
## don't have a valid "backup" to restore from, so the restore
## is temporarily being disabled.

#rm -rf $UPORTAL_HOME/data
#cp -r /home/flexibus/scripts/uportal/hsql-data $UPORTAL_HOME/data

