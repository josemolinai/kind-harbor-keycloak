
# Harbor keycloak kind-cluster

A local kubernetes cluster based on Kind to deploy harbor and keycloak.

## Requirements

* helm v3.8.2+
* kind v0.14.0+
* docker 20.10.16

## Instructions
Execute the following scripts

1. 0_init.sh
1. 1_start_cluster.sh
1. 2_init_keycloak.sh
1. 3_get_keycloak_password.sh
1. 4_init_harbor.sh

To destroy the cluster and release resources execute:

1. 5_destroy_cluster.sh
