#!/bin/bash

trap crtl_c INT

function crtl_c(){
    echo -e "\n\n[*] Exiting...\n"
    exit 0
}

for port in $(seq 1 65535); do
    timeout 1 bash -c "echo '' < /dev/tcp/$1/$port" 2>/dev/null && "Port: $port -- OPEN" &
done;wait