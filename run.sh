#!/bin/bash

cd "${0%/*}"
#change directory relative to script

source ../config.sh
source ./config.sh

docker stop $NAME
docker rm $NAME
#stop and remove an existing instance

docker run -d \
  --name $NAME \
  -h=$HNAME \
  --network=$NETWORK \
  --dns=$DNS \
  --dns-search=$DNS_SEARCH \
  --restart $RESTART_MODE \
  $IMAGE
