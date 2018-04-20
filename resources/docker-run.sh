#!/bin/bash
HOSTIP=$(ip route | awk '/default/ { print $3 }')
echo "docker -H tcp://${HOSTIP}:2376 run --rm -t $@"
