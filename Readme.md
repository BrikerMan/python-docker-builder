# Python Docker Image Builder

This is a tool to build python image with various base image.

## Available version

Here is the list of versions which is already available on [Docker hub](https://hub.docker.com/repository/docker/brikerman/python).

| Python | Base Image                             | Docker Tag                                         |
| ------ | -------------------------------------- | ------------------------------------------------- |
| 3.11.0 | ubuntu:20.04                           | 3.11.0..ubuntu--20.04                             |
| 3.10.8 | ubuntu:20.04                           | 3.10.8..ubuntu--20.04                             |
| 3.10.8 | nvidia/cuda:11.3.0-runtime-ubuntu20.04 | 3.10.8..nvidia---cuda--11.3.0-runtime-ubuntu20.04 |
| 3.9.15 | ubuntu:20.04                           | 3.9.15..ubuntu--20.04                             |
| 3.9.15 | nvidia/cuda:11.3.0-runtime-ubuntu20.04 | 3.9.15..nvidia---cuda--11.3.0-runtime-ubuntu20.04 |
| 3.8.15 | ubuntu:20.04                           | 3.8.15..ubuntu--20.04                             |
| 3.8.15 | nvidia/cuda:11.3.0-runtime-ubuntu20.04 | 3.8.15..nvidia---cuda--11.3.0-runtime-ubuntu20.04 |

You can get this image by

```bash
docker pull brikerman/python:{Docker Tag}
```

## How to trigger buid

### Github Action

Manually trigger github action with python version and base image.

### Local Build

```shell
sh build-helper.sh 3.8.10 nvidia/cuda:11.3.0-runtime-ubuntu20.04
```

## Docker tag replace rule

- `/` -> `---`
- `:` -> `--`

## Links

Github: [https://github.com/BrikerMan/python-docker-builder](https://github.com/BrikerMan/python-docker-builder)
