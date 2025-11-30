#!/bin/bash

function ctrl_c(){
	echo -e "\n\n[!] Saliendo..."
	tput  cnorm; exit 1
}

#Ctrl+C
trap ctrl_c INT

tput civis

for i in $(seq 1 254); do
	timeout 1 bash -c "ping -c 1 10.237.51.$i" &> /dev/null && echo "[+] El host 10.237.51.$i - ACTIVE" &
done; wait


tput cnorm
