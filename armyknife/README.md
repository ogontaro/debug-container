# ArmyKnife

ArmyKnife is a container image that consolidates a carefully selected set of tools for development, debugging, and
operations. It supports efficient work in diverse environments and adapts to various usage scenarios.

## Usage Example

To run the `ArmyKnife` container using Docker, use the following command:

```bash
docker run --rm -it ogontaro/armyknife
```

## Repository

The Docker image can be obtained from the following repository:

`ogontaro/armyknife`

## About the Tag

`ArmyKnife` provides the following two tags:

- `latest` tag: This tag operates as a non-root user named `knife`. It always includes the latest tools and security patches, eliminating the opportunity to use older versions of the image to ensure the highest level of security and functionality.
- `slim` tag: This tag is a lightweight version of the image, with some of the heavier packages removed. It is useful for environments with limited resources or for users who prefer a minimalistic setup.
- `root` tag: This tag is used when you want to run the container as the root user. It is useful for specific operations that require root privileges.

`ArmyKnife` only offers these two tags. This is a deliberate choice to ensure that users always have access to the latest tools and security patches, aiming to keep the development environment up-to-date. This policy prioritizes security.
This version separates the explanations for the latest and root tags and clarifies the reason for providing only these two tags.

## Build Frequency

The image is automatically built daily at 00:00 (JST), ensuring the latest tools and security patches are applied.

## Supported Programming Languages

- Python
- TypeScript (Deno)

## Pre-installed Tools

The following tools are pre-installed:

- `awscli` Command-line interface for AWS services.
- `bat` An enhanced version of the `cat` command, with features like syntax highlighting and Git integration.
- `curl` A command-line tool for transferring data using URLs.
- `dnsutils` A collection of DNS utilities including `dig`, `nslookup`, and `host`.
- `fd` A fast and user-friendly file search tool.
- `fzf` A tool for fuzzy searching on the command line.
- `git` A widely used distributed version control system for source code management.
- `htop` An interactive process viewer for real-time monitoring of system resource usage.
- `iproute2` A set of tools for managing Linux kernel network features.
- `jq` A command-line tool for processing JSON data.
- `kubectl` A command-line tool for managing Kubernetes clusters.
- `lsof` A tool for listing open files and network connections.
- `ncdu` A tool for visually displaying disk usage.
- `net-tools` A collection of network-related tools including `ifconfig`, `netstat`, and `route`.
- `ripgrep` A fast text search tool suitable for searching large codebases.
- `strace` A debugging tool for tracing system calls and signals.
- `tmux` A terminal multiplexer for opening multiple terminal sessions simultaneously.
- `tree` A command for displaying directory structures in a tree format.
- `unzip` A tool for extracting files from ZIP archives.
- `vim` An advanced text editor with syntax highlighting and code completion support for many programming languages.
- `wget` A utility for non-interactive download of files from the web.

## Shell

The default shell is `fish`. `bash` is also available.

## Workspace Directory

The `/workspace` directory is prepared for the `knife` user as a working space. This directory is set as the default
working directory when the container starts.
