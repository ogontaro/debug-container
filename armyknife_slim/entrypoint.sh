#!/usr/bin/env bash

# Execute all .sh files in the /opt/armyknife/init directory
for script in /opt/armyknife/init/*.sh; do
    bash "$script"
done

# Execute the passed command
exec "$@"
