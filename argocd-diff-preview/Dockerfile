FROM mikefarah/yq:latest AS yq
FROM node:lts-slim

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
  awscli \
  ca-certificates \
  curl \
  colordiff \
  git \
  jq \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY --from=yq /usr/bin/yq /usr/local/bin/yq
RUN ARGOCD_BINARY_ARCH=$(case "$TARGETPLATFORM" in "linux/amd64") echo "amd64" ;; "linux/arm64") echo "arm64" ;; *) exit 1 ;; esac) \
  && ARGOCD_BINARY_ARCH=amd64 && curl -sSL -o argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-${ARGOCD_BINARY_ARCH} \
  && install -m 555 argocd /usr/local/bin/argocd && rm argocd

COPY entrypoint.sh /entrypoint.sh
COPY argocd-diff-preview.sh /argocd-diff-preview.sh

USER node

WORKDIR /workspace

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/argocd-diff-preview.sh"]
