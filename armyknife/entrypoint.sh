#!/usr/bin/env bash

# Execute all .sh files in the /opt/armyknife/init directory
for script in /opt/armyknife/init/*.sh; do
  if [ -f "$script" ]; then
    bash "$script"
  fi
done

# Execute the passed command
exec "$@"
