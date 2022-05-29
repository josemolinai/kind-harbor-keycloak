#!/bin/sh
set -o errexit

# create registry container unless it already exists
reg_name='kind-registry'
reg_port='5001'
if [ "$(docker inspect -f '{{.State.Running}}' "${reg_name}" 2>/dev/null || true)" != 'true' ]; then
  docker run \
    -d --restart=always -p "127.0.0.1:${reg_port}:5000" --name "${reg_name}" \
    registry:2
fi

docker pull quay.io/keycloak/keycloak-operator:main
docker tag quay.io/keycloak/keycloak-operator:main localhost:5001/keycloak/keycloak-operator:main


docker push localhost:5001/keycloak/keycloak-operator:main

helm repo add harbor https://helm.goharbor.io
    