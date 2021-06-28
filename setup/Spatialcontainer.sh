#!/bin/sh

sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Install the nvidia-docker-2 software package.

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -

curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update

sudo apt-get install -y docker-ce nvidia-docker2

sudo systemctl restart docker

# Install Azure IOT Edge

# curl https://packages.microsoft.com/config/ubuntu/18.04/multiarch/prod.list > ./microsoft-prod.list

# sudo cp ./microsoft-prod.list /etc/apt/sources.list.d/

# curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg

# sudo cp ./microsoft.gpg /etc/apt/trusted.gpg.d/

# sudo apt-get update

# sudo apt-get install iotedge=1.0.9* libiothsm-std=1.0.9*

# sed -i  's/<ADD DEVICE CONNECTION STRING HERE>/fhgfhfkfffjg/g' /etc/iotedge/config.yaml

# sudo systemctl restart iotedge

