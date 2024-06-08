FROM docker/tilt:latest AS tilt
FROM docker:cli AS docker-cli
FROM ogontaro/armyknife:sudo

USER root

RUN apt-get update && apt-get install -y \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd docker && gpasswd -a knife docker

COPY --from=tilt /usr/local/bin/tilt /usr/local/bin/tilt
COPY --from=docker-cli /usr/local/bin/docker /usr/local/bin/docker
COPY --from=docker-cli /usr/local/bin/docker-compose /usr/local/bin/docker-compose

COPY init-scripts/*.sh /opt/armyknife/init/

# knife
USER 1000
