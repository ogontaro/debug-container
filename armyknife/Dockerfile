FROM denoland/deno:bin AS deno
FROM bitnami/kubectl:latest AS kubectl

FROM ubuntu:22.04

ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    git \
    vim \
    curl \
    unzip \
    lsof \
    net-tools \
    gdb \
    strace \
    python3 \
    python3-pip \
    awscli \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install CLI tools
COPY --from=deno /deno /usr/local/bin/deno
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/bin/kubectl

WORKDIR /workspace
