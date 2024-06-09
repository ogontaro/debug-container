FROM docker/tilt:latest AS tilt
FROM docker:cli AS docker-cli
FROM ogontaro/armyknife:sudo

USER root

RUN apt-get update && apt-get install -y \
    build-essential \
    pipx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd docker && gpasswd -a knife docker

COPY --from=tilt /usr/local/bin/tilt /usr/local/bin/tilt
COPY --from=docker-cli /usr/local/bin/docker /usr/local/bin/docker
COPY --from=docker-cli /usr/local/bin/docker-compose /usr/local/bin/docker-compose
RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin && chmod +x /usr/local/bin/task

COPY init-scripts/*.sh /opt/armyknife/init/

USER knife
RUN git clone --quiet --depth 1 https://github.com/asdf-vm/asdf.git ~/.asdf \
    && mkdir -p ~/.config/fish/completions \
    && echo "source ~/.asdf/asdf.fish" >> ~/.config/fish/config.fish \
    && ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
