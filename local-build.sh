#!/bin/bash
IN=$1

PY_VERSION=`echo $IN | cut -d \@ -f 1`
BASE_IMAGE_SAFE_TAG=`echo $IN | cut -d \@ -f 2`
BASE_IMAGE=$(echo "$BASE_IMAGE_SAFE_TAG" | sed "s/\-\-/\:/g")

echo "Building Python $PY_VERSION on $BASE_IMAGE"

DOCKER_TAG="${PY_VERSION}..${BASE_IMAGE_SAFE_TAG}"
DOCKER_TAG=$(echo "$DOCKER_TAG" | sed "s/\//\-\-\-/g")

echo "Build python image with tag: ${DOCKER_TAG}"
echo "BASE IMAGE SAFE TAG: ${BASE_IMAGE_SAFE_TAG}"
echo "Base image: ${BASE_IMAGE}"
echo "Python version: ${PY_VERSION}"

# Use this when builing locally
echo "Command: docker build . --build-arg PY_VERSION=${PY_VERSION} --build-arg BASE_IMAGE=${BASE_IMAGE} -t "brikerman/python:${DOCKER_TAG}""

docker build . --build-arg PY_VERSION=${PY_VERSION} --build-arg BASE_IMAGE=${BASE_IMAGE} -t "brikerman/python:${DOCKER_TAG}"