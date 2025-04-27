#!/bin/bash
# Lee IPs desde ip.txt y muestra los nombres de dominio asociados
while read ip; do
  ip=$(echo $ip | tr -d '[:space:]')
  if [ -n "$ip" ]; then
    host=$(nslookup "$ip" 2>/dev/null | awk '/name = / {print $4}')
    if [ -n "$host" ]; then
      echo "$ip - $host"
    else
      echo "$ip "
    fi
  fi
done < ip.txt
