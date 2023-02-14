#!/bin/bash


ciudades=$(awk '{print $1}' consumos.txt | sort -u)


for ciudad in $ciudades; do
    
    consumos=$(grep "^$ciudad " consumos.txt | awk '{print $4}')

    
    is_decreasing=true
    last_consumo=999999
    for consumo in $consumos; do
        if [ "$consumo" -gt "$last_consumo" ]; then
            is_decreasing=false
            break
        fi
        last_consumo=$consumo
    done

    
    if [ "$is_decreasing" = true ]; then
        echo "$ciudad tuvo consumos decrecientes en 2022"
    fi
done