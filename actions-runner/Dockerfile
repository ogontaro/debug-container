# https://github.com/actions/runner/blob/main/images/Dockerfile
FROM ghcr.io/actions/actions-runner:latest

USER root
RUN buildDeps="gnupg2 software-properties-common" && \
    apt-get update && \
    apt-get install -y --no-install-recommends curl git gh $buildDeps && \
    SUDO_FORCE_REMOVE=yes apt purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDeps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER runner
