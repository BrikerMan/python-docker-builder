#!/bin/bash
PY_VERSION=$1
BASE_IMAGE=$2
USE_SHORT_PY_VERSION=$3

source build-helper.sh $PY_VERSION $BASE_IMAGE $USE_SHORT_PY_VERSION
docker build . -t "brikerman/python:${DOCKER_TAG}"