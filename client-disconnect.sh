#!/bin/bash

echo "User $username disconnected." >> add_route.log

SUBNET_MATCHED=($(grep $username subnets.txt))

if [ "${#SUBNET_MATCHED[@]}" = "2" ]; then
  CMD="/sbin/ip route del ${SUBNET_MATCHED[1]}"
  echo "Route cmd is $CMD" >> add_route.log
  $CMD >> add_route.log 2>&1
  echo "Route to ${SUBNET_MATCHED[1]} deleted for $username" >> add_route.log
else
  echo "No subnet matched for $username" >> add_route.log
fi
