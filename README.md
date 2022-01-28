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

### Other alternatives
A simple alternative to docker is [podman](https://podman.io). 
