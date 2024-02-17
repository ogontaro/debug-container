# CONTRIBUTING GUIDE

## How to Add an Image

1. Create a subdirectory for the new image.
2. Add a `Dockerfile` and `params.json` file in the subdirectory.

## Build Image Locally

To build the image, run the following command: `task build`

### Passing Arguments to Docker Build

To pass arguments to the Docker build, use the following syntax: `task build -- DOCKERF_BUILD_ARGS`

For example:
`task build -- --build-arg HOGE=hello`

### Default Image Tag

By default, the image tag will be the name of the subdirectory containing the Dockerfile.
