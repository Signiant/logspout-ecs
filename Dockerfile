FROM gliderlabs/logspout:v3.2.1
ENTRYPOINT ["/ecs-entry.sh"]
RUN chmod +x /src/build.sh
COPY ecs-entry.sh /ecs-entry.sh
RUN chmod +x /ecs-entry.sh
