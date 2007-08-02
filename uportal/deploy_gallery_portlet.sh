UPORTAL_TOMCAT=/home/flexibus/uportal_tomcat/
CONTINUUM_PORTLET_PROJECT=/home/flexibus/continuum/working/16

check_errs()
{
  # Function. Parameter 1 is the return code
  # Para. 2 is text to display on failure.
  if [ "${1}" -ne "0" ]; then
     echo "ERROR # ${1} : ${2}"
     exit ${1}
  fi
}

cd $CONTINUUM_PORTLET_PROJECT//gallery-portlet
maven clean full -Dmaven.tomcat.home=$UPORTAL_TOMCAT
check_errs $?  "portlet failed to build."

cd ~/source/uPortal
ant deployPortletApp -DportletApp=$UPORTAL_TOMCAT/webapps/ImageGallery-Portlet.war
