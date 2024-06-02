FROM ogontaro/armyknife

USER root

RUN apt-get update && apt-get install -y \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN echo "knife ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/knife

# knife user
USER 1000
