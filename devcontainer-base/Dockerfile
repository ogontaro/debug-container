FROM docker/tilt:latest AS tilt
FROM ogontaro/armyknife:sudo

USER root
ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
  docker \
  docker-compose \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY --from=tilt /usr/local/bin/tilt /usr/local/bin/tilt

COPY init-scripts/*.sh /opt/armyknife/init/

# knife
USER 1000
