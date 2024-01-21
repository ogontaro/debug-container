FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    git \
    vim \
    curl \
    lsof \
    net-tools \
    gdb \
    strace \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["tail", "-f", "/dev/null"]
