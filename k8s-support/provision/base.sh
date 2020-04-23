#!/bin/bash

# add Google apt repo
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

# add Docker apt repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y

DEBIAN_FRONTEND=noninteractive apt install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common

apt autoremove -y
