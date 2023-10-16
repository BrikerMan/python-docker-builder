#!/bin/bash
PY_VERSION=$1
BASE_IMAGE=$2
USE_SHORT_PY_VERSION=$3

echo "Building Python $PY_VERSION on $BASE_IMAGE"

BASE_IMAGE_SAFE_TAG=$(echo "$BASE_IMAGE" | sed "s/\//\-\-\-/g")
BASE_IMAGE_SAFE_TAG=$(echo "$BASE_IMAGE_SAFE_TAG" | sed "s/\:/\-\-/g")

DOCKER_TAG="${PY_VERSION}..${BASE_IMAGE_SAFE_TAG}"

echo $USE_SHORT_PY_VERSION

if [[ $USE_SHORT_PY_VERSION == "true" ]]; then
    SHORT_PY_VERSION=$(echo "$PY_VERSION" | sed "s/\.[0-9]*$//g")
    SHORT_TAG="${SHORT_PY_VERSION}..${BASE_IMAGE_SAFE_TAG}"
    echo "Build python image with short tag : ${SHORT_TAG}"
    echo "DOCKER_FULL_TAG=brikerman/python:${DOCKER_TAG},brikerman/python:${SHORT_TAG}" >> $GITHUB_ENV
    export DOCKER_TAG=$SHORT_TAG
else
    echo "DOCKER_FULL_TAG=brikerman/python:${DOCKER_TAG}" >> $GITHUB_ENV
    export DOCKER_TAG=$DOCKER_TAG
fi

echo "PY_VERSION=${PY_VERSION}" >> $GITHUB_ENV
echo "BASE_IMAGE=${BASE_IMAGE}" >> $GITHUB_ENV

echo "Build python image with tag: ${DOCKER_TAG}"
echo "BASE IMAGE SAFE TAG: ${BASE_IMAGE_SAFE_TAG}"
echo "Base image: ${BASE_IMAGE}"
echo "Python version: ${PY_VERSION}"

# Read the Dockerfile template
template=$(<Dockerfile.Template)

# Replace the placeholders with the desired values
dockerfile="${template//BASE_IMAGE/$BASE_IMAGE}"
dockerfile="${dockerfile//PY_VERSION/$PY_VERSION}"

echo "$dockerfile" > Dockerfile