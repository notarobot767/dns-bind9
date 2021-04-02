#!/bin/bash

IMAGE="bind9"
#image to use

DNS="127.0.0.1"
#use self for dns

H_PORT="53"
C_PORT=$H_PORT
#dns port to publish to host
#left repetative for modular purposes
#dont forget tcp & udp

MEM_LIMIT="4g"

#NS1
#################
NAME="ns1"
HOST=$NAME

LOCAL_LOG="/disk2/logs/bind9"
REMOTE_LOG="/app/log"

#NS2
#################
NS2_NAME="ns2"
NS2_HOST=$NS2_NAME
NS2_LOCAL_LOG="/disk2/logs/bind9"
NS2_REMOTE_LOG="/app/log"
