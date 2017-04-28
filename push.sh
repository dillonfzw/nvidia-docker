#! /bin/bash

set -eu

REPOSITORY="nvidia/cuda-ppc64le"
OS="ubuntu16.04"
NO_OS_SUFFIX="true"
LATEST="true"

VERSION="8.0"
docker build --pull -t "${REPOSITORY}:${VERSION}-runtime-${OS}" "${VERSION}/runtime"
docker build -t "${REPOSITORY}:${VERSION}-devel-${OS}" "${VERSION}/devel"
if [[ "${NO_OS_SUFFIX}" == true ]]; then
    docker tag "${REPOSITORY}:${VERSION}-runtime-${OS}" "${REPOSITORY}:${VERSION}-runtime";
    docker tag "${REPOSITORY}:${VERSION}-devel-${OS}" "${REPOSITORY}:${VERSION}-devel";
fi
if [[ "${LATEST}" == true ]]; then
    docker tag "${REPOSITORY}:${VERSION}-devel-${OS}" "${REPOSITORY}:latest";
fi

VERSION="8.0-cudnn5"
CUDA_VERSION="8.0"
CUDNN_VERSION="cudnn5"
docker build -t "${REPOSITORY}:${VERSION}-runtime-${OS}" "${CUDA_VERSION}/runtime/${CUDNN_VERSION}"
docker build -t "${REPOSITORY}:${VERSION}-devel-${OS}" "${CUDA_VERSION}/devel/${CUDNN_VERSION}"
if [[ "${NO_OS_SUFFIX}" == true ]]; then
    docker tag "${REPOSITORY}:${VERSION}-runtime-${OS}" "${REPOSITORY}:${VERSION}-runtime";
    docker tag "${REPOSITORY}:${VERSION}-devel-${OS}" "${REPOSITORY}:${VERSION}-devel";
fi

VERSION="8.0-cudnn6"
CUDA_VERSION="8.0"
CUDNN_VERSION="cudnn6"
docker build -t "${REPOSITORY}:${VERSION}-runtime-${OS}" "${CUDA_VERSION}/runtime/${CUDNN_VERSION}"
docker build -t "${REPOSITORY}:${VERSION}-devel-${OS}" "${CUDA_VERSION}/devel/${CUDNN_VERSION}"
if [[ "${NO_OS_SUFFIX}" == true ]]; then
    docker tag "${REPOSITORY}:${VERSION}-runtime-${OS}" "${REPOSITORY}:${VERSION}-runtime";
    docker tag "${REPOSITORY}:${VERSION}-devel-${OS}" "${REPOSITORY}:${VERSION}-devel";
fi

docker push "${REPOSITORY}"
