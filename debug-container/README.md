# debug-container

The `debug-container` is a container image used for debugging Pods within a Kubernetes cluster.

This image contains various tools and can be used for debugging purposes.

Also, run `tail -f /dev/null` so that this container does not exit

## how to kubectl debug

see [here](./docs/kubectl-debug.md)

## Supported Tools

- git
- vim
- curl
- unzip
- lsof
- net-tools
- gdb
- strace
- python3
- python3-pip
- awscli
- kubectl
- deno
