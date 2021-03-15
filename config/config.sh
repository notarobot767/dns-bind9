#!/bin/bash

RESTART_MODE="always"
#docker restart mode

IMAGE="localhost/dns-bind9:latest"
#image to use

NAME="ns1"
#name of container

DNS="127.0.0.1"
#local dns server for network

LOCAL_LOG="/disk2/logs/bind9"
REMOTE_LOG="/app/log"

H_PORT="53"
C_PORT=$H_PORT
#dns port to publish to host
#left repetative for modular purposes
#dont forget tcp & udp
