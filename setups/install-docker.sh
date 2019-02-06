#!/bin/sh
# Install docker in the virtual machine using this script
# For more detail visit https://docs.docker.com/install/linux/docker-ce/ubuntu/

# The commands need to be executed with sudo. use sudo ./install-docker.sh
if [ -z $SUDO_USER ]
then
    echo "===== script needs to be executed by super user ===="
    exit 0
fi

# SET UP THE REPOSITORY

# update the apt package
apt-get update

# install packages to allow apt to use a repository over HTTPS
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# add docker's official gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, 
# by searching for the last 8 characters of the fingerprint.

apt-key fingerprint 0EBFCD88

# pub   rsa4096 2017-02-22 [SCEA]
#       9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
# uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
# sub   rsa4096 2017-02-22 [S]

# set up the stable repository
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# update the apt package
apt-get update

# install latest version of 
apt-get install docker-ce docker-ce-cli containerd.io

echo "trying to run the hello world container"

docker run hello-world

# logout of vagrant. Login to check if docker is installed properly

echo "vagrant ssh and check docker --version"
exit




