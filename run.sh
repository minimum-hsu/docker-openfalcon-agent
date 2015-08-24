#!/bin/bash
tar -zxf $PACKDIR/$PACKFILE -C $WORKDIR
cp $CONFIGDIR/$CONFIGFILE $WORKDIR
$WORKDIR/control restart
$WORKDIR/control tail
