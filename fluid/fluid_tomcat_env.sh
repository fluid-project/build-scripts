export ANT_HOME=/home/flexibus/bin/apache-ant-1.7.0
export PATH=${ANT_HOME}/bin:${PATH}
export JAVA_OPTS='-server -XX:+UseParallelGC -Xmx768m -XX:MaxPermSize=128m -Djava.awt.headless=true'
export CATALINA_HOME=/home/flexibus/fluid_tomcat
export CATALINA_PID=/home/flexibus/fluid_catalina_pid

check_errs()
{
  # Function. Parameter 1 is the return code
  # Para. 2 is text to display on failure.
  if [ "${1}" -ne "0" ]; then
    echo "ERROR # ${1} : ${2}"
    exit ${1}
  fi
}

