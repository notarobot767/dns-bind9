#!/bin/bash

cd "${0%/*}"
#change directory relative to script

podman build -f dockerfile.conf \
	-t dns-bind9 \
	.
