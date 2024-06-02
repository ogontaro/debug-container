#!/usr/bin/env bash

# Execute all .sh files in the /opt/armyknife/init directory
for script in /opt/armyknife/init/*.sh; do
  if [ -f "$script" ]; then
    echo "Executing $script..."
    bash "$script"
  else
    echo "No .sh files found in /opt/armyknife/init directory."
  fi
done

# Execute the passed command
exec "$@"
