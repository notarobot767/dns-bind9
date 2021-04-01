#!/bin/bash

IMAGE="bind9"
#image to use

NAME="ns1"
HOST=$NAME
#name of container

DNS="127.0.0.1"
#use self for dns

LOCAL_LOG="/disk2/logs/bind9"
REMOTE_LOG="/app/log"

H_PORT="53"
C_PORT=$H_PORT
#dns port to publish to host
#left repetative for modular purposes
#dont forget tcp & udp

MEM_LIMIT="4g"
