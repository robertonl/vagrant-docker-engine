A simple alternative for running Docker Desktop on mac

# Introduction
Given the [new constraints on Docker Desktop](https://www.docker.com/pricing/faq) in affect from 31st January 2022, some people will be left without access to docker for local development. 
This guide serves as a simple example of how to set up docker to run on mac, without the use of Docker Desktop. 

# Installation 

Clone the repository and cd into it

```
bash install.sh
```

The command above will install the following
* virtualbox
* vagrant
* ansible
* docker cli ( and docker compose) 

It will also asks for a static IP address to assign to the VM running docker


# Mounting volumes

Since docker will be running from VM, any volumes to be mounted in a container, 
will need to be mounted in the VM as well. 


The Vagrantfile mounts a local folder `data` at `/data` in the docker VM. This location 
can then be used to have any local files which then will be further mounted onto a container

# Exporting ports

In order to access exposed dokcer ports from your local host, you will need to forward them in the vagrant file. 
This is straight forward to do by adding the following: 

```
config.vm.network 'forwarded_port', guest: <remote port>, host: <local port>, id: '<some id>'
```

Once the line(s) have been added, reload the VM by running

```
vagrant reload
```

### Other alternatives
A simple alternative to docker is [podman](https://podman.io). 
