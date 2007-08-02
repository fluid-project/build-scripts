check_errs()
{
  # Function. Parameter 1 is the return code
  # Para. 2 is text to display on failure.
  if [ "${1}" -ne "0" ]; then
     echo "ERROR # ${1} : ${2}"
     exit ${1}
  fi
}

cd fluid-components
maven clean full
check_errs $?  "fluid-components failed to build."

cd ../gallery
maven cln bld
check_errs $?  "gallery failed to build."

cd ../gallery-portlet
maven clean war:war 
