kubectl -n keycloak get secrets credential-main-dev-keycloak -o jsonpath='{.data.ADMIN_PASSWORD}' | base64 --decode
