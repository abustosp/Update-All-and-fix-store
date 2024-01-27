#!/bin/bash

echo "-------------------------------"
echo "Actualizar Programas"
echo "-------------------------------"

sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y

echo "-------------------------------"
echo "Programas actualizados"
echo "-------------------------------"

echo "-------------------------------"
echo "Actualizar programas del store"
echo "-------------------------------"

snap-store --quit
sudo snap refresh

echo "-------------------------------"
echo "Programas actualizados"
echo "-------------------------------"

echo "-------------------------------"
echo "Remover Snaps viejos"
echo "-------------------------------"

set -eu

LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done

echo "-------------------------------"
echo "Snaps Borrados"
echo "-------------------------------"

