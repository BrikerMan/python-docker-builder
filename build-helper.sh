#!/bin/bash
IN=$1

PY_VERSION=`echo $IN | cut -d \@ -f 1`
BASE_IMAGE_SAFE_TAG=`echo $IN | cut -d \@ -f 2`
BASE_IMAGE=$(echo ${BASE_IMAGE_SAFE_TAG/\-\-/\:})

echo "Building Python $PY_VERSION on $BASE_IMAGE"
if [[ $BASE_IMAGE = "ubuntu:20.04" ]]
then
  DOCKER_TAG="${PY_VERSION}"
else
  DOCKER_TAG="${PY_VERSION}--${BASE_IMAGE_SAFE_TAG}"
fi

echo "Build python image with tag: ${DOCKER_TAG}"
echo "Base image: ${BASE_IMAGE}"
echo "Python version: ${PY_VERSION}"

echo "DOCKER_TAG=${DOCKER_TAG}" >> $GITHUB_ENV
echo "PY_VERSION=${PY_VERSION}" >> $GITHUB_ENV
echo "BASE_IMAGE=${BASE_IMAGE}" >> $GITHUB_ENV

# Use this when builing locally
# docker build . --build-arg PY_VERSION=${PY_VERSION} --build-arg BASE_IMAGE=${BASE_IMAGE} -t ${DOCKER_TAG}