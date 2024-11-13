#!/bin/bash
host="$1"
adresa_ip="$2"
dns="$3"

lookup_ip=$(dig +short "$host" @"$dns")
lookup_host=$(dig +short -x "adresa_ip" @"dns")
if [[ "$lookup_ip" == "$adresa_ip" && "$lookup_host" == "$host" ]]; then
	echo "Asocierea este corecta"
else
	echo "Asocierea nu este corecta"
fi
