# BIND9 DNS Server using Docker Compose

## Purpose
The purpose is to run and manage a DNS server using Bind9 through Docker Compose. This code is made for Docker on Ubuntu but can be adapted for your environment. Please feel to share and adapt this project for your own specific needs.

## Usage
The code ran an managed using [docker-compose](https://docs.docker.com/compose/compose-file/compose-file-v3/).

`docker-compose up -d`

`docker-compose down`

`docker-compose --help`

## Important Files
### [env_file](https://github.com/notarobot767/dns-bind9/blob/master/.env)
Variables used on in [docker-compose.yml](https://github.com/notarobot767/dns-bind9/blob/master/docker-compose.yml). Edit variables for binding IP/port and external log directories.

### [/app](https://github.com/notarobot767/dns-bind9/blob/master/app)
This configuration is based off my server, so change the configuration to match yours. Within the config folder, your root configuration file must be named named.conf. However you organize and reference the remainder of your configuration is up to you. I split my configuration within the named and zone folder. This repository is not meant to be Bind configuration tutorial. View [this guide](https://bind9.readthedocs.io/en/latest/) or another for your bind setup.