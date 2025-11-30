#!/bin/bash

# Manejo de interrupción con CTRL+C
function ctrl_c(){
    echo -e "\n\n[!] Saliendo...\n"
    tput cnorm
    exit 1
}
trap ctrl_c INT

# Ocultar cursor para mejor visualización
tput civis

# Rango de subredes a escanear (ajustar según necesidad)
start_subnet=1   # Desde 10.143.0.0
end_subnet=254    # Hasta 10.143.10.0 (puedes aumentar si es necesario)

# Verificar si el comando ping existe
if ! command -v ping > /dev/null 2>&1; then
    echo "[ERROR] El comando 'ping' no está instalado. Instálalo y vuelve a ejecutar el script."
    tput cnorm
    exit 1
fi

# Escaneo en cada subred de 10.143.X.0/24
for sub in $(seq $start_subnet $end_subnet); do
    echo -e "\n[+] Scanning network 192.168.$sub.$i/24:\n"
    for i in $(seq 1 254); do
        (timeout 1 ping -c 1 -W 1 192.168.$sub.$i > /dev/null 2>&1 && echo -e "\t[+] Host 192.168.$sub.$i - ACTIVE") &
    done
    wait  # Esperar a que terminen los procesos de la subred
done

# Restaurar cursor
tput cnorm

