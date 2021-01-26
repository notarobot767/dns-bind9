#!/bin/bash

RESTART_MODE="always"
#docker restart mode

IMAGE="localhost/dns-bind9:latest"
#image to use

NAME="ns1"
#name of container

NETWORK="SERVERS"
#container network

H_PORT_1="53"
C_PORT_1=$H_PORT_1
#dns port to publish to host
#left repetative for modular purposes

H_PORT_2=$H_PORT_1
C_PORT_2=$H_PORT_1
#for udp variant
