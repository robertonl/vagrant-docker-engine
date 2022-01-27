A simple alternative for running Docker Desktop on mac

# Introduction
Given the [new constraints on Docker Desktop](https://www.docker.com/pricing/faq) in affect from 31st January 2022, some people will be left without access to docker for local development. 
This guide serves as a simple example of how to set up docker to run on mac, without the use of Docker Desktop. 

# Prerequisites
- vagrant
- virtual box
- ansible and ansible-galaxy
- docker  (cli)
- docker-compose

In order to set up mounted volumes through virtual box on vagrant, it is necessary to install the following plugin. 

```
vagrant plugin install vagrant-vbguest
```


To simplify installation of docker, we will use the `geerlingguy.docker` role

```
ansible-galaxy install geerlingguy.docker
```


# Installation 

```
git clone repository && cd repository
```

Change the IP address in the `Vagrantfile`

```
  config.vm.network 'private_network', ip: '<choose your own ip here>'
```

Ensure the folder `data` exists in the root of the cloned repository

```
vagrant up 
```

once that finishes ( and there are no problems), you need to run the following: 

```
export DOCKER_HOST=tcp://<ip address of vm>:2375
```

Test that everything works: 

```
docker run hello-world
```

### Other alternatives
A simple alternative to docker is [podman](https://podman.io). 
