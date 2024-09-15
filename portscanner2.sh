#!/bin/bash

network=$1
port=$2



if [ -z "$network" ] || [ -z "$port" ]; then
  echo "Usage: $0 <network_prefix> <port>"
  exit 1
fi

echo "ip,port" > scan_results.csv


for ((ip=1; ip<=254; ip++)); do
  ipaddr="$network.$ip"


  timeout 1 bash -c "echo > /dev/tcp/$ipaddr/$port" 2>/dev/null && echo "$ipaddr,$port" >> scan_results.csv
do


echo "Scan complete. results saved in scan_results.csv"
