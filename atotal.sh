#!/bin/bash


ciudad=""
total=0


function total_ciudad {
    total=0
    for i in $(cat consumos.txt | grep $1 | cut -d" " -f3)
    do
        total=$(($total+$i))
    done
}


while [ -z $ciudad ]
do
    read -p "Introduce una ciudad: " ciudad
    total_ciudad $ciudad
    if [ $total -eq 0 ]
    then
        echo "La ciudad no existe"
        ciudad=""
    fi
done

echo "El total de consumo de $ciudad es $total"





