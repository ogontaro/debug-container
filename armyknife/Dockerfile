FROM denoland/deno:bin AS deno
FROM bitnami/kubectl:latest AS kubectl
FROM mikefarah/yq:latest AS yq

FROM ubuntu:24.04

ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
  bat \
  ca-certificates \
  curl \
  git \
  dnsutils \
  duf \
  fd-find \
  fzf \
  htop \
  iproute2 \
  lsof \
  jq \
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
COPY --from=deno /deno /usr/local/bin/deno
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/kubectl
COPY --from=yq /usr/bin/yq /usr/local/bin/yq

RUN fish -c "curl -sL https://git.io/fisher | source ; fisher install jorgebucaran/fisher"

# apg-get install bat to batcat
## see: https://github.com/sharkdp/bat/issues/1186
RUN ln -s /usr/bin/batcat /usr/bin/bat

# apg-get install fdfind to fd
RUN ln -s /usr/bin/fdfind /usr/bin/fd

# install aws-cli v2
RUN ARCH=$(uname -m) && \
  if [ "$ARCH" = "x86_64" ]; then \
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
  elif [ "$ARCH" = "aarch64" ]; then \
  curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"; \
  else \
  echo "Unsupported architecture: $ARCH" && exit 1; \
  fi && \
  unzip awscliv2.zip && \
  ./aws/install && \
  rm -rf awscliv2.zip aws

RUN groupadd -r knife --gid 1000 && useradd --no-log-init -r -m -g knife knife --uid 1000 -s /usr/bin/fish
RUN mkdir /workspace && chown -R knife:knife /workspace

RUN mkdir -p /opt/armyknife/init/
COPY init-scripts/*.sh /opt/armyknife/init/
COPY entrypoint.sh /entrypoint.sh

USER knife

WORKDIR /workspace

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/fish"]
