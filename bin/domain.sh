#!/bin/bash

# Lee la dirección IP y el nombre de la máquina desde el archivo
ip_address=$(awk '{print $1}' /home/$USER/.config/bin/domain)
machine_name=$(awk '{print $2}' /home/$USER/.config/bin/domain)

# Comprueba si al menos uno de los dos está presente
if [ "$ip_address" ] || [ "$machine_name" ]; then
    echo "%{F#ff3399} DOMAIN: %{F-}%{F#ffee00}$ip_address%{u-} $machine_name%{F-}"
else
    echo "%{F#00000000} DOMAIN: %{u-}%{F#ffee00} "
fi

