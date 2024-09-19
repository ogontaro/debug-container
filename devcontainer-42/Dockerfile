FROM ogontaro/devcontainer-base

USER root
RUN apt-get update && apt-get install -y \
  python3-pip \
  clang-format \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER knife
RUN python3 -m pip install c_formatter_42 norminette
RUN cp /usr/bin/clang-format /home/knife/.local/lib/python3.10/site-packages/c_formatter_42/data/clang-format-linux

COPY init-scripts/*.sh /opt/armyknife/init/
