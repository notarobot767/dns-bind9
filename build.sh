#!/bin/bash

cd "${0%/*}"
#change directory relative to script

docker build -f dockerfile.conf \
	-t dns-bind9 \
	.