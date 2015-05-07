#!/bin/sh

# get the AWS instance ID
INST=`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id`

if [ ! -z "$INST" ]; then
        if [ ! -z "$SYSLOG_HOSTNAME" ]; then
                SYSLOG_HOSTNAME=${SYSLOG_HOSTNAME}_$INST
        fi
fi

/bin/logspout "$@"
