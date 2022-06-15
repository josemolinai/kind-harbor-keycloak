#!/bin/bash
kubectl -n harbor create secret tls harbor-tls --key="./cert/harbor.dev.local.key" --cert="./cert/harbor.dev.local.crt"
helm install -n harbor -f ./harbor_values.yaml harbor  harbor/harbor