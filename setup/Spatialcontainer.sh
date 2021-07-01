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

# create the local group and user for the edge module
# these are mapped from host to container in the deployment manifest in the desire properties for the module
sudo groupadd -g 1010 localedgegroup
sudo useradd --home-dir /home/localedgeuser --uid 1010 --gid 1010 localedgeuser
sudo mkdir -p /home/localedgeuser

# create folders to be used by the rtspsim module
sudo mkdir -p /home/localedgeuser/samples
sudo mkdir -p /home/localedgeuser/samples/input



# give the local user access
sudo chown -R localedgeuser:localedgegroup /home/localedgeuser/

# set up folders for use by the Video Analyzer module
# these are mounted in the deployment manifest

# !NOTE! these folder locations are must match the folders used in `deploy-modules.sh` and ultimately the IoT edge deployment manifest

# general app data for the module
sudo mkdir -p /var/lib/videoanalyzer 
sudo chown -R localedgeuser:localedgegroup /var/lib/videoanalyzer/
sudo mkdir -p /var/lib/videoanalyzer/tmp/ 
sudo chown -R localedgeuser:localedgegroup /var/lib/videoanalyzer/tmp/
sudo mkdir -p /var/lib/videoanalyzer/logs
sudo chown -R /localedgeuser:localedgegroup /var/lib/videoanalyzer/logs

# output folder for file sink
sudo mkdir -p /var/media
sudo chown -R localedgeuser:localedgegroup /var/media/


