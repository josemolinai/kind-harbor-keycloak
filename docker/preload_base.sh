#!/bin/sh

./preload.sh kindest/node:v1.24.0@sha256:0866296e693efe1fed79d5e6c7af8df71fc73ae45e3679af05342239cdc5bc8e kindest/node:v1.24.0
./preload.sh quay.io/keycloak/keycloak-operator:main keycloak/keycloak-operator:main

./preload.sh goharbor/nginx-photon:v2.5.0 goharbor/nginx-photon:v2.5.0
./preload.sh goharbor/harbor-portal:v2.5.0 goharbor/harbor-portal:v2.5.0
./preload.sh goharbor/harbor-core:v2.5.0 goharbor/harbor-core:v2.5.0
./preload.sh goharbor/harbor-jobservice:v2.5.0 goharbor/harbor-jobservice:v2.5.0
./preload.sh goharbor/registry-photon:v2.5.0 goharbor/registry-photon:v2.5.0
./preload.sh goharbor/harbor-registryctl:v2.5.0 goharbor/harbor-registryctl:v2.5.0
./preload.sh goharbor/chartmuseum-photon:v2.5.0 goharbor/chartmuseum-photon:v2.5.0
./preload.sh goharbor/trivy-adapter-photon:v2.5.0 goharbor/trivy-adapter-photon:v2.5.0
./preload.sh goharbor/notary-server-photon:v2.5.0 goharbor/notary-server-photon:v2.5.0
./preload.sh goharbor/notary-signer-photon:v2.5.0 goharbor/notary-signer-photon:v2.5.0
./preload.sh goharbor/harbor-db:v2.5.0 goharbor/harbor-db:v2.5.0
./preload.sh goharbor/redis-photon:v2.5.0 goharbor/redis-photon:v2.5.0
./preload.sh goharbor/harbor-exporter:v2.5.0 goharbor/harbor-exporter:v2.5.0  