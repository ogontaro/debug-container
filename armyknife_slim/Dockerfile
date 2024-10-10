FROM mikefarah/yq:latest AS yq

FROM ubuntu:24.04

ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
  bat \
  ca-certificates \
  curl \
  gdb \
  git \
  dnsutils \
  duf \
  fd-find \
  fzf \
  htop \
  iproute2 \
  fish \
  ncdu \
  net-tools \
  ripgrep \
  strace \
  tree \
  tmux \
  unzip \
  vim \
  wget \
  zoxide \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install CLI tools
COPY --from=yq /usr/bin/yq /usr/local/bin/yq

RUN fish -c "curl -sL https://git.io/fisher | source ; fisher install jorgebucaran/fisher"

# apg-get install bat to batcat
## see: https://github.com/sharkdp/bat/issues/1186
RUN ln -s /usr/bin/batcat /usr/bin/bat

# apg-get install fdfind to fd
RUN ln -s /usr/bin/fdfind /usr/bin/fd

RUN groupadd -r knife --gid 1000 && useradd --no-log-init -r -m -g knife knife --uid 1000 -s /usr/bin/fish
RUN mkdir /workspace && chown -R knife:knife /workspace

RUN mkdir -p /opt/armyknife/init/
COPY init-scripts/*.sh /opt/armyknife/init/
COPY entrypoint.sh /entrypoint.sh

USER knife

WORKDIR /workspace

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/fish"]
