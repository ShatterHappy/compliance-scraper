#!/bin/bash

# Takes in:
# cknum
# status
# msg

cknum=$1
status=$2
msg=$3

if [ -z "$1" ]; then
  echo "Check number not passed properly - Note this is not a standalone script, please run ../complianceScrape.sh"
  exit 0
fi
if [ -z "$2" ]; then
  echo "Status for chk $1 not passed properly - Note this is not a standalone script, please run ../complianceScrape.sh"
  exit 0
fi
if [ -z "$3" ]; then
  echo "Message for chk $1 not passed properly - Note this is not a standalone script, please run ../complianceScrape.sh"
  exit 0
fi

echo "<CKBOX>" >> $REPORTFILE
echo "<CKNUM>"$cknum"</CKNUM>" >> $REPORTFILE
echo "<STATUS>"$status"</STATUS>" >> $REPORTFILE
echo "<MSG>"$msg"</MSG>" >> $REPORTFILE
echo "</CKBOX>" >> $REPORTFILE
