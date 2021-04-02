#!/bin/bash

cd "${0%/*}"
#change directory relative to script

source ../config.sh
source ./config/config.sh
#add global then local config parameters

NAME=$NS2_NAME
HOST=$NS2_HOST

docker rm -f $NAME

docker run -d \
  --name $NAME \
  -h $NS2_HOST \
  --network $NETWORK \
  -m $MEM_LIMIT \
  --restart $RESTART_MODE \
  -e TZ=$TZ \
  --dns=$DNS \
  -v $NS2_LOCAL_LOG:$NS2_REMOTE_LOG \
  -p $BINDING_IP2:$H_PORT:$C_PORT \
  -p $BINDING_IP2:$H_PORT:$C_PORT/udp \
  -p $BINDING_IPV6_2:$H_PORT:$C_PORT \
  -p $BINDING_IPV6_2:$H_PORT:$C_PORT/udp \
  $IMAGE
