#!/bin/bash

cd "${0%/*}"
#change directory relative to script

source ../config.sh
source ./config.sh
#add global then local config parameters

podman stop $NAME
podman rm $NAME
#stop and remove an existing instance

podman run -d \
  --name $NAME \
  -h $NAME \
  --network $NETWORK \
  --restart $RESTART_MODE \
  -p $H_PORT_1:$C_PORT_1 \
  -p $H_PORT_2:$C_PORT_2/udp \
  $IMAGE
