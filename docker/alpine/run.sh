#!/bin/bash

#
# Note that this file should be put under the same directory
# with control script for 2 reasons:
#
# 1. This file sets the alias then source the script to
#     retain the setting for the purpose of making control
#     script work normally on Alpine without modification.
# 2. The control script will change its working directory.
#

APP="falcon-agent"
WAIT_SERVICE_READY=10

# Expand alias to make control compatible with Alpine
alias ps='pstree'
shopt -s expand_aliases

check_service()
{
  # Source the script to retain the alias
  status=$(source $WORKDIR/control status)
  echo $status | grep -q "stoped"
  if [ $? -eq 0 ] ; then
    return 1
  else
    return 0
  fi
}

# Source the script to retain the alias
source $WORKDIR/control restart
while sleep $WAIT_SERVICE_READY; do
  check_service
  if [ $? -eq 1 ] ; then
    echo "$APP exited"
    exit 1
  fi
done
