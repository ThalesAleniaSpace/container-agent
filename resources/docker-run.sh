#!/bin/bash
HOSTIP=$(ip route | awk '/default/ { print $3 }')
docker -H tcp://${HOSTIP}:2376 run --rm -t $@
