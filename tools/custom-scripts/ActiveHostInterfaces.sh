#!/bin/bash
function ctrl_c(){
    echo -e "\n\n[!] Saliendo...\n"
    tput cnorm; exit 1
}

trap ctrl_c INT

network=(10.143.1 10.143.2 10.143.3 10.143.4 10.143.5 10.143.6 10.143.7 10.143.8 10.143.9 )

tput civis
for net in ${network[@]}; do
    echo -e "\n[+] Scanning network $net.0/24:\n"
    for i in $(seq 1 254); do
        timeout 1 bash -c "ping -c 1 $net.$i" &>/dev/null && echo -e "\t[+] Host $net.$i - ACTIVE" &
    done; wait
done
tput cnorm
