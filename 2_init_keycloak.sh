#!/bin/sh
kubectl apply -f ./infra/KeycloakOperator/resources/keycloak.org_keycloakbackups_crd.yaml
kubectl apply -f ./infra/KeycloakOperator/resources/keycloak.org_keycloakrealms_crd.yaml
kubectl apply -f ./infra/KeycloakOperator/resources/keycloak.org_keycloakusers_crd.yaml
kubectl apply -f ./infra/KeycloakOperator/resources/keycloak.org_keycloakclients_crd.yaml
kubectl apply -f ./infra/KeycloakOperator/resources/keycloak.org_keycloaks_crd.yaml


kubectl apply -f ./infra/KeycloakOperator/resources/role.yaml -n keycloak
kubectl apply -f ./infra/KeycloakOperator/resources/role_binding.yaml -n keycloak
kubectl apply -f ./infra/KeycloakOperator/resources/service_account.yaml -n keycloak
kubectl apply -f ./infra/KeycloakOperator/resources/operator.yaml

kubectl apply -f ./infra/KeycloakOperator/resources/main-dev-realm.yaml
kubectl apply -f ./infra/KeycloakOperator/resources/main-dev-client.yaml
kubectl apply -f ./infra/KeycloakOperator/resources/main-dev-client-user.yaml

kubectl apply -f ./infra/KeycloakOperator/resources/keycloak.yaml
kubectl apply -f ./infra/KeycloakOperator/resources/ingress.yaml
