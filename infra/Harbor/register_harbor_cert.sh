#!/bin/bash
sudo mkdir -p /etc/docker/certs.d/harbor.dev.local
sudo cp ./cert/harbor.dev.local.crt /etc/docker/certs.d/harbor.dev.local/ca.crt
sudo service docker restart