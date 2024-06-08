FROM docker/tilt:latest AS tilt
FROM docker:cli AS docker-cli
FROM ogontaro/armyknife:sudo

USER root
RUN groupadd docker && gpasswd -a knife docker

COPY --from=tilt /usr/local/bin/tilt /usr/local/bin/tilt
COPY --from=docker-cli /usr/local/bin/docker /usr/local/bin/docker
COPY --from=docker-cli /usr/local/bin/docker-compose /usr/local/bin/docker-compose

# knife
USER 1000
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

USER root
COPY init-scripts/*.sh /opt/armyknife/init/

# knife
USER 1000
RUN echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
RUN mkdir -p ~/.config/fish
RUN echo 'eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.config/fish/config.fish
COPY Brewfile /home/knife/Brewfile
RUN fish -c 'source ~/.config/fish/config.fish; brew bundle --file=/home/knife/Brewfile'
