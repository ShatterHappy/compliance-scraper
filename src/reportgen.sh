#!/bin/bash

date=$1
REPORTFILE=$OUTDIR/$date'_compliance_report.xml'

if [ -z "$1" ]; then
  echo "Date not passed properly - Note this is not a standalone script, please start ../complianceScrape.sh"
  exit 0
fi

cat > $REPORTFILE <<'endmsg'
=============================
Security Scan Results:
=============================
endmsg

echo "Date: "$date >> $REPORTFILE

export REPORTFILE
