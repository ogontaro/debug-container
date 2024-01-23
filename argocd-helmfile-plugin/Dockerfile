FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y \
    git \
    wget \
    curl \
    ca-certificates \
    gpg \
    && curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null \
    && apt-get install -y apt-transport-https \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list \
    && apt-get update \
    && apt-get install -y helm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/helmfile/helmfile/releases/download/v0.160.0/helmfile_0.160.0_linux_amd64.tar.gz -O - | tar xz \
    && mv helmfile /usr/local/bin \
    && chmod +x /usr/local/bin/helmfile

WORKDIR /workspace

CMD ["tail", "-f", "/dev/null"]
