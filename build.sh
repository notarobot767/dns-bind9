#!/bin/bash

cd "${0%/*}"
#change directory relative to script

podman build --tag bind9 \
        -f "./dockerfile.conf"
        #build docker file
