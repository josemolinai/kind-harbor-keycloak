#!/bin/bash
curl -Lo ./helm-v3.8.2-linux-amd64.tar.gz  https://get.helm.sh/helm-v3.8.2-linux-amd64.tar.gz
mkdir -p ~/.local/bin
mkdir -p /tmp/helm-v3.8.2
sudo tar -xzf ./helm-v3.8.2-linux-amd64.tar.gz  -C /tmp/helm-v3.8.2/
sudo mv  /tmp/helm-v3.8.2/linux-amd64/helm ~/.local/bin/
rm -f ./helm-v3.8.2-linux-amd64.tar.gz