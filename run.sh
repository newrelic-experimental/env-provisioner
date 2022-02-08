#!/usr/bin/env bash

IMAGE_NAME="otel-env-provisioner"

if [ ! -d ~/.aws ]; then
  echo "aws credentials folder should exist in your home"
  exit 1
fi

if [ ! -d ~/.ssh ]; then
  echo "ssh keys folder should exist in your home"
  exit 1
fi

if [[ "${AWS_PROFILE}" == "" || "${AWS_REGION}" == "" ]]; then
  echo "environment variables AWS_PROFILE and AWS_REGION are mandatory"
  exit 1
fi

PROJECT_DIR=/srv

docker build -t "${IMAGE_NAME}" . >/dev/null 2>&1
docker run -it --rm \
  -v "$(pwd)":"${PROJECT_DIR}" \
  -v ~/.aws:/root/.aws:ro \
  -v ~/.ssh:/root/.ssh:ro \
  -e AWS_PROFILE="${AWS_PROFILE}" \
  -e AWS_REGION="${AWS_REGION}" \
  -w "${PROJECT_DIR}" ${IMAGE_NAME} "${PROJECT_DIR}/entrypoint.sh"
