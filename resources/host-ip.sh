#!/bin/bash
HOSTIP=$(ip route | awk '/default/ { print $3 }')
echo $HOSTIP
