#!/bin/bash


# Generate a Certificate Authority Certificate


rm -fR ./infra/Harbor/cert/
mkdir -p ./infra/Harbor/cert/

## Generate a CA certificate private key.
openssl genrsa -out ./infra/Harbor/cert/ca.key 4096

## Generate the CA certificate.
openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=CN/ST=Dev/L=Dev/O=dev/OU=dev/CN=harbor.dev.local" \
 -key ./infra/Harbor/cert/ca.key \
 -out ./infra/Harbor/cert/ca.crt

 #Generate a Server Certificate

 ##Generate a private key.
 openssl genrsa -out ./infra/Harbor/cert/harbor.dev.local.key 4096

 ##Generate a certificate signing request (CSR).
 openssl req -sha512 -new \
    -subj "/C=CN/ST=Dev/L=Dev/O=dev/OU=dev/CN=harbor.dev.local" \
    -key ./infra/Harbor/cert/harbor.dev.local.key \
    -out ./infra/Harbor/cert/harbor.dev.local.csr

#Generate an x509 v3 extension file.
cat > ./infra/Harbor/cert/v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=harbor.dev.local
DNS.2=harbor.dev
DNS.3=hostname
EOF

#Use the v3.ext file to generate a certificate for your Harbor host.
openssl x509 -req -sha512 -days 3650 \
    -extfile ./infra/Harbor/cert/v3.ext \
    -CA ./infra/Harbor/cert/ca.crt -CAkey ./infra/Harbor/cert/ca.key -CAcreateserial \
    -in ./infra/Harbor/cert/harbor.dev.local.csr \
    -out ./infra/Harbor/cert/harbor.dev.local.crt


kubectl -n harbor create secret tls harbor-tls --key="./infra/Harbor/cert/harbor.dev.local.key" --cert="./infra/Harbor/cert/harbor.dev.local.crt"
helm install -n harbor -f ./infra/Harbor/harbor_values.yaml harbor  harbor/harbor