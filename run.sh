#!/bin/bash

cd "${0%/*}"
#change directory relative to script

source ./config.sh

podman stop $NAME
podman rm $NAME
#stop and remove an existing instance

podman run -d \
  --name $NAME \
  -h=$HNAME \
  --network $NETWORK \
  --ip $IP \
  --dns=$DNS \
  --dns-search=$DNS_SEARCH \
  --restart $RESTART_MODE \
  -e TZ=$TZ \
  -e PUID=$PUID \
  -e PGID=$PGID \
  -v $LOCAL_CONFIG:$REMOTE_CONFIG:ro \
  $IMAGE \
  $REMOTE_CONFIG_FILE
