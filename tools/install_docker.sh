#!/bin/bash

# Actualizando repositorios
sudo apt update

# Instalando dependencias
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# Agregando clave de repositorio docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Agregando repositorio docker
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Revisando versión candidata
apt-cache policy docker-ce

# Instalando docker-ce
sudo apt install docker-ce -y

# Agregando usuario al grupo docker
sudo usermod -aG docker ${USER}

# Cargando en la sesión la pertenencia al grupo docker
su - ${USER}
