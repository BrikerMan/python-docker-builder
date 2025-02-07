# Python Docker Image Builder

This is a tool to build python image with various base image.

## Available version

Here is the list of versions which is already available on [Docker hub](https://hub.docker.com/repository/docker/brikerman/python).

| Python Major Version | Python Version | Base Image   | Docker Tag          | Updated Time |
| -------------------- | -------------- | ------------ | ------------------- | ------------ |
| 3.13                 | 3.13.2         | ubuntu:24.04 | 3.13-ubuntu-24.04   | 20250207     |
| 3.13                 | 3.13.2         | ubuntu:22.04 | 3.13-ubuntu-22.04   | 20250207     |
| 3.12                 | 3.12.9         | ubuntu:22.04 | 3.12-ubuntu-22.04   | 20250207     |
| 3.12                 | 3.12.9         | ubuntu:24.04 | 3.12-ubuntu-24.04   | 20250207     |
| 3.11                 | 3.11.9         | ubuntu:22.04 | 3.11..ubuntu--22.04 | 20240603     |
| 3.10                 | 3.10.13        | ubuntu:22.04 | 3.10..ubuntu--20.04 | 20231017     |
| 3.9                  | 3.9.18         | ubuntu:22.04 | 3.9..ubuntu--20.04  | 20231017     |
| 3.8                  | 3.8.18         | ubuntu:22.04 | 3.8..ubuntu--20.04  | 20231017     |

All version

| Python  | Base Image                             | Docker Tag                                        |
| ------- | -------------------------------------- | ------------------------------------------------- |
| 3.12.3  | ubuntu:22.04                           | 3.12.3..ubuntu--22.04                             |
| 3.12.0  | ubuntu:22.04                           | 3.12.0..ubuntu--22.04                             |
| 3.11.3  | ubuntu:22.04                           | 3.11.9..ubuntu--22.04                             |
| 3.11.6  | ubuntu:22.04                           | 3.11.6..ubuntu--22.04                             |
| 3.11.2  | ubuntu:20.04                           | 3.11.2..ubuntu--20.04                             |
| 3.10.10 | ubuntu:20.04                           | 3.10.10..ubuntu--20.04                            |
| 3.9.16  | ubuntu:20.04                           | 3.9.16..ubuntu--20.04                             |
| 3.9.16  | nvidia/cuda:11.3.0-runtime-ubuntu20.04 | 3.9.16..nvidia---cuda--11.3.0-runtime-ubuntu20.04 |
| 3.8.16  | ubuntu:20.04                           | 3.8.16..ubuntu--20.04                             |
| 3.8.16  | nvidia/cuda:11.3.0-runtime-ubuntu20.04 | 3.8.16..nvidia---cuda--11.3.0-runtime-ubuntu20.04 |

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

### Update on 20250207

Updated to this to avoid `..` causing issues on mac client with proxy.

- `/` -> `-`
- `:` -> `-`

### Legacy tag

- `/` -> `---`
- `:` -> `--`

## Links

Github: [https://github.com/BrikerMan/python-docker-builder](https://github.com/BrikerMan/python-docker-builder)
