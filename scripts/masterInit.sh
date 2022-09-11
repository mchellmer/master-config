#!/bin/bash
########################## docker ##########################
# update ubuntu
apt-get update

# install deps
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# gpg key for docker
mkdir -p /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# repo setup
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# start service and test
service docker start
docker run hello-world