#!/bin/bash

RESTART_MODE="always"
#docker restart mode

IMAGE="dns-bind9:latest"
#image to use

NAME="ns1"
#name of container

HNAME="ns1.ogrydziak.net"
#hostname of container

DNS="127.0.0.1"
#local dns server for network

NETWORK="host"
