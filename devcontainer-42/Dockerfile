FROM ogontaro/devcontainer-base

USER knife

RUN python3 -m pip install c_formatter_42 norminette

COPY init-scripts/*.sh /opt/armyknife/init/
