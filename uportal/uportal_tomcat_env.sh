export ANT_HOME=/home/flexibus/bin/apache-ant-1.7.1
export M2_HOME=/usr/java/apache-maven-2.2.1
export JAVA_OPTS='-server -XX:+UseParallelGC -Xmx768m -XX:MaxPermSize=128m -Djava.awt.headless=true'
export JAVA_HOME=/usr/lib/jvm/sun-jdk-1.6/
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

