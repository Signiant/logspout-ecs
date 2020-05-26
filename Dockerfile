FROM gliderlabs/logspout:v3.2.8

ENTRYPOINT ["/ecs-entry.sh"]

COPY ecs-entry.sh /ecs-entry.sh
RUN chmod +x /ecs-entry.sh
