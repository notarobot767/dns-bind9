
# Containerized DNS server using BIND9 through Podman

## Purpose
This repository allows the user to run and manage an DNS server using BIND9 through containerization. This code is made with Podman on RHEL8 but can be adapted for Docker. The specific server configuration is created for my own home network, but please feel free to adapt it for your own specific needs.

## Important Files
### [build.sh](https://github.com/notarobot767/dns-bind9/blob/master/build.sh)
Run this script to build your bind image. This script references to [dockerfile.conf](https://github.com/notarobot767/dns-bind9/blob/master/dockerfile.conf) to build your image. The image is based off [Alpine Linux](https://hub.docker.com/_/alpine). build.sh will add the Bind repository, copy the contents of the config folder to the container folder /app, and add a default entry point for the path to named.conf.

### [named.conf](https://github.com/notarobot767/dns-bind9/blob/master/config/named.conf)
This configuration is based off my server, so change the configuration to match yours. Within the config folder, your root configuration file must be named named.conf. However you organize and reference the remainder of your configuration is up to you. I split my configuration within the named and zone folder. This repository is not meant to be Bind configuration tutorial. View [this guide](https://bind9.readthedocs.io/en/latest/) or another for your bind setup.

### [run.sh](https://github.com/notarobot767/dns-bind9/blob/master/run.sh)
This script will pull parameters from [config.sh](https://github.com/notarobot767/dns-bind9/blob/master/config.sh) and instantiates a BIND9 container. If a container of the same name already exists, the script will stop the instance, remove that container, and then run the run command. This script by default points to the named.conf which was copied into the image with build.sh to /app, but you could use the entry point to point to a different named.conf. Also note that run.sh sources a file not in this repository called ../config.sh. The ../ indicates it is located in the parent folder. In order to run run.sh, you will need to uncommit that line in run.sh and add the necessary variables not already defined in ./config.sh. Alternatively, you could create a config.sh in the parent folder. The purpose of doing this would be to add global parameters for other containers you plan to run with Podman. That is why ../config is sourced first followed by ./config. Config.sh in this repository is meant to be locally scoped parameters.
