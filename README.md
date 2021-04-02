
# Containerized DNS server using Bind9 and Docker

## Purpose
This repository allows the user to run and manage an DNS server using Bind9 through containerization. This code is made for Docker on Ubuntu but can be adapted for your environment. Please feel to share and adapt this project for your own specific needs.

## Note
Most of the detailed comments are in the code itself. You will need to modify some of the variables in the config if those objects do not exist, such as the network name. Also, you will need to dowload another configuration file mentioned below or comment out the sources to ../config.sh.

## Important Files
### [build.sh](https://github.com/notarobot767/dns-bind9/blob/master/build.sh)
Run this script to build your bind image. This script references to [dockerfile.conf](https://github.com/notarobot767/dns-bind9/blob/master/config/dockerfile.conf) to build your image. The image is based off [Alpine Linux](https://hub.docker.com/_/alpine). build.sh will add the Bind repository, copy the contents of the config folder to the container folder /app, and add a default entry point for the path to named.conf. This and the other scripts below reference a local and global configuration file. The local [config.sh](https://github.com/notarobot767/dns-bind9/blob/master/config/config.sh) is located in this repository and used to store all the variables. The intent is this file will be the only file needed to change the data through variables and the other files should be left alone unless changing the logic or operation. The global [config.sh](https://github.com/notarobot767/global_config) has the same concept but is in its own repository because it is meant to be used for other docker projects to avoid repetition.

### [named.conf](https://github.com/notarobot767/dns-bind9/blob/master/config/named.conf)
This configuration is based off my server, so change the configuration to match yours. Within the config folder, your root configuration file must be named named.conf. However you organize and reference the remainder of your configuration is up to you. I split my configuration within the named and zone folder. This repository is not meant to be Bind configuration tutorial. View [this guide](https://bind9.readthedocs.io/en/latest/) or another for your bind setup.

### [run.sh](https://github.com/notarobot767/dns-bind9/blob/master/run.sh)
This script will pull parameters from [config.sh](https://github.com/notarobot767/dns-bind9/blob/master/config.sh) and instantiates a Bind9 container. If a container of the same name already exists, the script will stop the instance, remove that container, and then run the run command. This script by default points to the named.conf which was copied into the image with build.sh to /app, but you could use the entry point to point to a different named.conf. Also note that run.sh sources a file not in this repository called ../config.sh. The ../ indicates it is located in the parent folder. In order to run run.sh, you will need to uncommit that line in run.sh and add the necessary variables not already defined in ./config.sh. Alternatively, you could create a config.sh in the parent folder. The purpose of doing this would be to add global parameters for other containers you plan to run with Podman. That is why ../config is sourced first followed by ./config. Config.sh in this repository is meant to be locally scoped parameters.
