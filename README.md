# DNS Server using BIND9

## Purpose
This repository allows the user to run and manage an DNS server using BIND9 through containerization. This code is made for RHEL8/Centos8 with Podman, but can be adapted for your flavor of Linux and Docker. The specific server configuration is created for my own home network, but please feel free to adapt it for your own specific needs.

## Important Files
### [build.sh](https://github.com/notarobot767/dns-bind9/blob/master/build.sh)
This script points to [dockerfile.conf](https://github.com/notarobot767/dns-bind9/blob/master/dockerfile.conf) to then build your Podman image. The image is based off [Alpine Linux](https://hub.docker.com/_/alpine) and simply adds the bind repository with an entry point of your path to the Chrony configuration file.

### [run.sh](https://github.com/notarobot767/dns-bind9/blob/master/run.sh)
This script will pull parameters from [config.sh](https://github.com/notarobot767/dns-bind9/blob/master/config.sh) and instantiate a BIND9 container. If a container of the same name already exists, the script will stop the instance, remove the container, and then run the run command. This script injects the path to the [Bind configuration file](https://github.com/notarobot767/dns-bind9/blob/master/config/named.conf), but you could point it somewhere else.
