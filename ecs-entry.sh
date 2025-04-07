#!/bin/sh

# get the AWS instance ID
if [ ! -z "$OFF_AWS" ]; then
        echo "Not running on AWS - will not get the instance ID"
else
        TOKEN=$(curl -sX PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 60")
        INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
fi

# append the instance ID to an already set syslog hostname
if [ -n "$INSTANCE_ID" ] && [ -n "$SYSLOG_HOSTNAME" ]; then
        SYSLOG_HOSTNAME=${SYSLOG_HOSTNAME}_$INSTANCE_ID
else
        SYSLOG_HOSTNAME=${SYSLOG_HOSTNAME}
fi

/bin/logspout "$@"
