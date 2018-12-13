#!/bin/bash

DEBUG=false
version=0.1
vers_date=11/25/2018
CODEDIR="/home/andy/Documents/complianceScrape/"  #Scraper main directory
OUTDIR="/tmp/"                                    #Directory for report generation
total_checks=0

function help_syntax {
  echo ""
  echo "Audit tool help menu: "
  echo ""
  echo " -h --help                   Help Menu"
  echo " -v                          Version Info"

  exit
}

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      help_syntax ;;
    -v)
      echo $version
      echo 'Released on:' $vers_date
      exit ;;
    *)
      break ;;
  esac
done

if [ -x /bin/date ]; then
  date=$(/bin/date +"%Y%m%d")
elif [ -x /usr/bin/date ]; then
  date=$(/bin/date +"%Y%m%d")
else
  echo "Need /bin/date or /usr/bin/date to document reports properly"
fi

export CODEDIR
export OUTDIR

source $CODEDIR/src/reportgen.sh $date

for check in $(cat $CODEDIR/vars/checks); do
  if [ ! -f $CODEDIR/src/check_files/$check.sh ]; then
    echo "Check $check not found"
  fi
  ((total_checks++))
  source $CODEDIR/src/check_files/$check.sh
done
