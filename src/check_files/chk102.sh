#!/bin/bash

###########################################################
# Checks that umask default is set to not allow users who #
# are not the file owner to write to the file             #
# umask should be: xx[2,3,6,7][2,3,6,7]                   #
###########################################################

id=102

useradd -m test
umask=$(su - test -c "umask")
userdel -r test >> /dev/null

#variable for last digit of umask which applies to everyone
evr=$(echo -n $umask | tail -c 1 )
grp=$(echo -n $umask | tail -c 2 | head -c 1 )

if [ $evr -eq 0 ] || [ $evr -eq 1 ] || [ $evr -eq 4 ] || [ $evr -eq 4 ]; then
  pf=FAIL
  data="UMASK:$umask - EVERYONE:UMASK default should not allow files created to be written to by users who did not create the file"
elif [ $grp -eq 0 ] || [ $grp -eq 1 ] || [ $grp -eq 4 ] || [ $grp -eq 4 ]; then
  pf=FAIL
  data="UMASK:$umask - GROUP:UMASK default should not allow files created to be written to by users who did not create the file"
else
  pf=PASS
  data="UMASK:$umask"
fi

source $CODEDIR/src/printer.sh $id $pf $data
