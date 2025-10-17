#!/bin/bash

# remove previous assets
rm -rf ./public/assets/configs
rm -rf ./public/assets/multichain
rm -rf ./public/assets/envs.js

docker buildx create --use --name multiarch >/dev/null 2>&1 || docker buildx use multiarch
docker buildx inspect --bootstrap

docker build --progress=plain --platform=linux/amd64 --build-arg GIT_COMMIT_SHA=$(git rev-parse --short HEAD) --build-arg GIT_TAG=$(git describe --tags --abbrev=0) -t cuonghxdak/blockscout-frontend:v1.0.1 ./