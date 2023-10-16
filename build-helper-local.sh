#!/bin/bash
PY_VERSION=$1
BASE_IMAGE=$2

source build-helper.sh $PY_VERSION $BASE_IMAGE
docker build . -t "brikerman/python:${DOCKER_TAG}"