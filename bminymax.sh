#!/bin/bash 

cantLineas=`cat consumos.txt | wc -l` 

consumoMax=0 

consumoMin=1000 

 
 

for i in `seq 2 $cantLineas` 

do 

    consumlin=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $4}'` 

 
 

    if [ $consumlin -lt $consumoMin ] 

    then 

        consumoMin=$consumlin 

        ciudadMin=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $1}'` 

        mesMin=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $2}'` 

        yearMin=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $3}'` 

    fi 

 
 

    if [ $consumlin -gt $consumoMax ] 

    then 

        consumoMax=$consumlin 

        ciudadMax=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $1}'` 

        mesMax=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $2}'` 

        yearMax=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $3}'` 

    fi 

done 

 
 

echo "Max Consumo --> $ciudadMax , $mesMax , $yearMax." 

echo "Min Consumo --> $ciudadMin , $mesMin , $yearMin." 