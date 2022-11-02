#!/bin/bash
PY_VERSION=$1
BASE_IMAGE=$2

echo "Building Python $PY_VERSION on $BASE_IMAGE"

BASE_IMAGE_SAFE_TAG=$(echo "$BASE_IMAGE" | sed "s/\//\-\-\-/g")
BASE_IMAGE_SAFE_TAG=$(echo "$BASE_IMAGE_SAFE_TAG" | sed "s/\:/\-\-/g")

DOCKER_TAG="${PY_VERSION}..${BASE_IMAGE_SAFE_TAG}"

echo "Build python image with tag: ${DOCKER_TAG}"
echo "BASE IMAGE SAFE TAG: ${BASE_IMAGE_SAFE_TAG}"
echo "Base image: ${BASE_IMAGE}"
echo "Python version: ${PY_VERSION}"

# Use this when builing locally
echo "Command: docker build . --build-arg PY_VERSION=${PY_VERSION} --build-arg BASE_IMAGE=${BASE_IMAGE} -t "brikerman/python:${DOCKER_TAG}""

docker build . --build-arg PY_VERSION=${PY_VERSION} --build-arg BASE_IMAGE=${BASE_IMAGE} -t "brikerman/python:${DOCKER_TAG}"