FROM ubuntu:24.04

USER root
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/mutagen-io/mutagen/releases/download/v0.17.5/mutagen_linux_amd64_v0.17.5.tar.gz
RUN tar -xvf mutagen_linux_amd64_v0.17.5.tar.gz
RUN mv mutagen /usr/local/bin/mutagen

RUN groupadd -r mutagen --gid 1000 && useradd --no-log-init -r -m -g mutagen mutagen --uid 1000
RUN mkdir /workspace && chown -R mutagen:mutagen /workspace

# mutagen user
USER 1000

ENTRYPOINT ["/usr/local/bin/mutagen"]
