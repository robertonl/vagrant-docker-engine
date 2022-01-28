#! /usr/bin/env bash


# Install virtual box if necessary
if ! command -v VBoxManage &> /dev/null
then
  brew install --cask virtualbox
  brew install --cask virtualbox-extension-pack
fi

# # Install the docker cli commands
if ! command -v docker &> /dev/null
then
  brew install docker
  brew install docker-compose
fi

if ! command -v vagrant &> /dev/null
then 
  brew install vagrant
  vagrant plugin install vagrant-vbguest
fi

# # # install ansible
if ! command -v ansible &> /dev/null
then
  python3 -m pip install ansible
  ansible-galaxy install geerlingguy.docker
fi

# Specify IP address for the docker vm 
read -p "Enter the IP address to be used by the VM running docker: " ip_address

sed -i.bak "s/<REPLACE ME>/$ip_address/" Vagrantfile

# Get the docker container up and running 
vagrant up

export DOCKER_HOST=tcp://$ip_address:2375

# test that docker works
docker run hello-world
