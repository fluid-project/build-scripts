export JAVA_OPTS='-server -XX:+UseParallelGC -Xmx768m -XX:MaxPermSize=128m -Djava.awt.headless=true'
export JAVA_HOME=/usr/java/jdk1.5.0_06
export CATALINA_HOME=/home/flexibus/uportal_tomcat
export CATALINA_PID=/home/flexibus/uportal_catalina_pid
export UPORTAL_HOME=/home/flexibus/source/uPortal/trunk
export CONTINUUM_PORTLET_PROJECT=/home/flexibus/continuum/working/34

check_errs()
{
  # Function. Parameter 1 is the return code
  # Para. 2 is text to display on failure.
  if [ "${1}" -ne "0" ]; then
    echo "ERROR # ${1} : ${2}"
    if [ "${1}" -ne "10" ]; then
      exit ${1}
    fi
  fi
}

