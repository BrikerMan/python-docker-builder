#!/bin/bash
PY_VERSION=$1
BASE_IMAGE=$2

echo "Building Python $PY_VERSION on $BASE_IMAGE"

BASE_IMAGE_SAFE_TAG=$(echo "$BASE_IMAGE" | sed "s/\:\-\-//g")

DOCKER_TAG="${PY_VERSION}..${BASE_IMAGE_SAFE_TAG}"
DOCKER_TAG=$(echo "$DOCKER_TAG" | sed "s/\//\-\-\-/g")

echo "Build python image with tag: ${DOCKER_TAG}"
echo "BASE IMAGE SAFE TAG: ${BASE_IMAGE_SAFE_TAG}"
echo "Base image: ${BASE_IMAGE}"
echo "Python version: ${PY_VERSION}"

echo "DOCKER_TAG=${DOCKER_TAG}" >> $GITHUB_ENV
echo "PY_VERSION=${PY_VERSION}" >> $GITHUB_ENV
echo "BASE_IMAGE=${BASE_IMAGE}" >> $GITHUB_ENV
