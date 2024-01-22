FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y \
    git \
    curl \
    ca-certificates \
    gpg \
    && curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null \
    && apt-get install -y apt-transport-https \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list \
    && apt-get uppdate \
    && apt-get install -y helm helmfile\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["tail", "-f", "/dev/null"]
