# Docker Python Builder

This is a personal tool to build python image with various base image to suit personal use cases.

## How to trigger buid

1. Create a new release with tag in format `<python-version>@<base-image-tag>`, you need to replace the `:` in `base-image-tag` with `--`. For example, `3.8.6@nvidia/cuda--11.3.0-runtime-ubuntu20.04`
2. This will trigger a github action, and build a image with tag `3.8.6---nvidia/cuda--11.3.0-runtime-ubuntu20.04`

## Pre-build images

You can get pre-build images here: [Docker hub]()

## Links

Github: [https://github.com/BrikerMan/python-docker-builder](https://github.com/BrikerMan/python-docker-builder)