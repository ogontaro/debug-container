#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ -e /var/run/docker.sock ] ; then
  sudo chown root:docker /var/run/docker.sock
  sudo chmod 660 /var/run/docker.sock
fi
