#!/bin/bash

cd "${0%/*}"
#change directory relative to script

source ../config.sh
source ./config/config.sh
#add global then local config parameters

docker stop $NAME
docker rm $NAME

docker run -d \
  --name $NAME \
  -h $HOST \
  --network $NETWORK \
  -m $MEM_LIMIT \
  --restart $RESTART_MODE \
  -e TZ=$TZ \
  --dns=$DNS \
  -v $LOCAL_LOG:$REMOTE_LOG \
  -p $BINDING_IP:$H_PORT:$C_PORT \
  -p $BINDING_IP:$H_PORT:$C_PORT/udp \
  -p $BINDING_IPv6:$H_PORT:$C_PORT \
  -p $BINDING_IPv6:$H_PORT:$C_PORT/udp \
  $IMAGE
