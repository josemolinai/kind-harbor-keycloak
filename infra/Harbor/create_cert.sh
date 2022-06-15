#!/bin/bash

# Generate a Certificate Authority Certificate

FILE=./cert/ca.crt
if test -f "$FILE"; then
    echo "$FILE exists. Remove to recreate"
else    
## Generate a CA certificate private key.
openssl genrsa -out ./cert/ca.key 4096

## Generate the CA certificate.
openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=CN/ST=Dev/L=Dev/O=dev/OU=dev/CN=harbor.dev.local" \
 -key ./cert/ca.key \
 -out ./cert/ca.crt

 #Generate a Server Certificate

 ##Generate a private key.
 openssl genrsa -out ./cert/harbor.dev.local.key 4096

 ##Generate a certificate signing request (CSR).
 openssl req -sha512 -new \
    -subj "/C=CN/ST=Dev/L=Dev/O=dev/OU=dev/CN=harbor.dev.local" \
    -key ./cert/harbor.dev.local.key \
    -out ./cert/harbor.dev.local.csr

#Generate an x509 v3 extension file.
cat > ./cert/v3.ext <<-EOF
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
    -extfile ./cert/v3.ext \
    -CA ./cert/ca.crt -CAkey ./cert/ca.key -CAcreateserial \
    -in ./cert/harbor.dev.local.csr \
    -out ./cert/harbor.dev.local.crt

fi    