#!/bin/sh

# get the AWS instance ID
INST=`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id`

# append the instance ID to an already set syslog hostname
if [ ! -z "$INST" ]; then
        if [ ! -z "$SYSLOG_HOSTNAME" ]; then
                SYSLOG_HOSTNAME=${SYSLOG_HOSTNAME}_$INST
        fi
else
        SYSLOG_HOSTNAME=${SYSLOG_HOSTNAME}
fi

/bin/logspout "$@"
