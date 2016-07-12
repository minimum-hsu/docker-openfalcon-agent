#!/bin/bash

WAIT_SERVICE_READY=10
pidfile=var/app.pid

function check_pid(){
    if [ -f $pidfile ];then
        pid=`cat $pidfile`
        if [ -n $pid ]; then
            running=`ps -p $pid|grep -v "PID TTY" |wc -l`
            return $running
        fi
    fi
    return 0
}

$WORKDIR/control restart
sleep $WAIT_SERVICE_READY
check_pid
if [ $? -gt 0 ] ; then
  $WORKDIR/control tail
else
  echo "Failed to start."
  exit 1
fi
