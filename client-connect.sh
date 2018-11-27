#!/bin/bash

echo "User $username connected." >> add_route.log

SUBNET_MATCHED=($(grep $username subnets.txt))

if [ "${#SUBNET_MATCHED[@]}" = "2" ]; then
  CMD="/sbin/ip route add ${SUBNET_MATCHED[1]} via $ifconfig_pool_remote_ip"
  echo "Route cmd is $CMD" >> add_route.log
  $CMD >> add_route.log 2>&1
  echo "Routed ${SUBNET_MATCHED[1]} to $ifconfig_pool_remote_ip for $username" >> add_route.log
else
  echo "No subnet matched for $username" >> add_route.log
fi
