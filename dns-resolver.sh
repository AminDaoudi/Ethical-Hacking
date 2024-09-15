#!/bin/bash


network_prefix=$1
dns=$2

for ip in {1..254}; do
  full_ip="$network_prefix.$ip"
  reverse_ip=$(echo $full_ip | awk -F. '{print $4"."$3"."$2"."$1".in-addr.arpa"}')
  result=$(dig @$dns -x $full_ip +short)


  [ -n "$result" ] && echo "$reverse_ip name = $result"
done
