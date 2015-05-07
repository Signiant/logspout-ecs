# logspout-ecs
specialization of the logspout container modified to set the hostname including the instance ID on ECS

This small tweak runs a small shell script before invoking logspout to get the instance ID from the EC2 metatdata.  It then appends that to whatever is passed in as the SYSLOG_HOST environment variable to use the final value as the syslog hostname.

This is useful when running on AWS ECS and sending logs to papertrail because you can then see which ECS cluster node your container is running on.

Ensure you pass in SYSLOG_HOST as an environment variable.
