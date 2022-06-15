#!/bin/sh
set -o errexit


# create registry container unless it already exists
reg_name='dev-registry'
reg_port='5001'
reg_storage='/mnt/registry/dev'
repo_local='localhost:5001' 

if [ -d "$reg_storage" ]; then
    echo "The ${DIR} folder is already here"
else
  sudo mkdir -p $reg_storage
   echo "The ${DIR} folder has been created"
fi

if [ "$(docker inspect -f '{{.State.Running}}' "${reg_name}" 2>/dev/null || true)" != 'true' ]; then
  docker run \
    -d --restart=always -p "127.0.0.1:${reg_port}:5000" --name "${reg_name}" \
    -v $reg_storage:/var/lib/registry \
    registry:2
fi

cd ./docker 
./preload_base.sh
cd ../

helm repo add harbor https://helm.goharbor.io
    