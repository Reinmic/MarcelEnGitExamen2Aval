#!/bin/bash

consumoT=0
apariciones=$(cat consumos.txt | grep $1 | wc -l)

for i in $(seq 1 $apariciones); do
  consumo=$(cat consumos.txt | grep $1 | head -n$i | tail -n1 | awk '{print $4}')
  consumoT=$(($consumoT + $consumo))
done

media=$(($consumoT / $apariciones))

if [ $media -lt 400 ]; then
  echo "La ciudad de $1 es ECO"
else
  echo "La ciudad de $1 NO es ECO"
fi