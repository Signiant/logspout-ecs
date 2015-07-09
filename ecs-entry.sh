#!/bin/sh

# get the AWS instance ID
if [ ! -z "$OFF_AWS" ]; then
        echo "Not running on AWS - will not get the instance ID"
else
        INST=`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id`
fi

# append the instance ID to an already set syslog hostname
if [ ! -z "$INST" ]; then
        if [ ! -z "$SYSLOG_HOSTNAME" ]; then
                SYSLOG_HOSTNAME=${SYSLOG_HOSTNAME}_$INST
        fi
else
        SYSLOG_HOSTNAME=${SYSLOG_HOSTNAME}
fi

/bin/logspout "$@"
