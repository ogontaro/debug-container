FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    git \
    vim \
    curl \
    wget \
    lsof \
    net-tools \
    gdb \
    strace \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["tail", "-f", "/dev/null"]
