FROM gliderlabs/logspout:master
ENTRYPOINT ["/ecs-entry.sh"]

COPY ecs-entry.sh /ecs-entry.sh
RUN chmod +x /ecs-entry.sh
