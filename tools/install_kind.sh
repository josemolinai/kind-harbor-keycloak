#!/bin/bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64
chmod +x ./kind
mkdir -p ~/.local/bin
sudo mv ./kind ~/.local/bin/