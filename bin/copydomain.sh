#!/bin/bash

# Obtengo la IP del archivo TARGET
ip_address=$(cat /home/$USER/.config/bin/domain | awk '{print $1}')

# Copio sin dejar salto de linea
echo -n "$ip_address" | xclip -sel clip

# Notifico IP copiada
notify-send "[Domain Copied]" "IP: $ip_address"
