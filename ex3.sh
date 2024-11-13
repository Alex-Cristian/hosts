#!/bin/bash
cat /etc/hosts | while read -r ip name; do
    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ && ! -z $name ]]; then
      ip_adress=$(nslookup "$name" | awk '/^Address: / { print $2; exit}')
      if [[ $ip_adress && $ip_adress != "$ip" ]]; then
         echo "Bogus IP for $name in /etc/hosts!"
      fi
    fi
done
