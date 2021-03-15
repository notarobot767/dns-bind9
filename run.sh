#!/bin/bash

cd "${0%/*}"
#change directory relative to script

source ../config.sh
source ./config/config.sh
#add global then local config parameters

podman stop $NAME
podman rm $NAME
#stop and remove an existing instance

podman run -d \
  --name $NAME \
  --network $NETWORK \
  --restart $RESTART_MODE \
  -e TZ=$TZ \
  -e PUID=$PUID \
  -e PGID=$PGID \
  --dns=$DNS \
  -v $LOCAL_LOG:$REMOTE_LOG \
  -p $BINDING_IP:$H_PORT:$C_PORT \
  -p $BINDING_IP:$H_PORT:$C_PORT/udp \
  $IMAGE
