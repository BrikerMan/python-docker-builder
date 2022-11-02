# Docker Python Builder

This is a personal tool to build python image with various base image to suit personal use cases.

## Available version

Here is the list of versions which is already available on [Docker hub](https://hub.docker.com/repository/docker/brikerman/python).

| Python | Base Image                             | DockerTag                                         |
| ------ | -------------------------------------- | ------------------------------------------------- |
| 3.11.0 | ubuntu:20.04                           | 3.11.0..ubuntu--20.04                             |
| 3.10.8 | ubuntu:20.04                           | 3.10.8..ubuntu--20.04                             |
| 3.9.15 | ubuntu:20.04                           | 3.9.15..ubuntu--20.04                             |
| 3.8.15 | ubuntu:20.04                           | 3.8.15..ubuntu--20.04                             |
| 3.8.15 | nvidia/cuda:11.3.0-runtime-ubuntu20.04 | 3.8.15..nvidia---cuda--11.3.0-runtime-ubuntu20.04 |

You can get this image by

```bash
`docker pull brikerman/python:{DockerTag}`
```

## How to trigger buid

Github tag replace rule:

- `:` -> `--`

Docker tag replace rule:

- `/` -> `---`
- `:` -> `--`
- `@` -> `..`

1. Create a new release with tag in format `<python-version>@<base-image-tag>`, for example `3.8.6@nvidia/cuda--11.3.0-runtime-ubuntu20.04`.
2. This will trigger a github action, and build a image with tag `3.8.6..nvidia---cuda--11.3.0-runtime-ubuntu20.04`

## Pre-build images

You can get pre-build images here: [Docker hub](https://hub.docker.com/repository/docker/brikerman/python)

## Links

Github: [https://github.com/BrikerMan/python-docker-builder](https://github.com/BrikerMan/python-docker-builder)
