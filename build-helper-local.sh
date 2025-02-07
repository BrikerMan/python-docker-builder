#!/bin/bash

# 参数校验
if [ $# -ne 2 ]; then
    echo "Usage: $0 <version> <base_image>"
    exit 1
fi

PY_VERSION=$1
BASE_IMAGE=$2

source build-helper.sh $PY_VERSION $BASE_IMAGE

# 构建Docker镜像
docker build \
    --build-arg PYTHON_VERSION="${PY_VERSION}" \
    -t "brikerman/python:${DOCKER_TAG}" \
    -f Dockerfile \
    .
