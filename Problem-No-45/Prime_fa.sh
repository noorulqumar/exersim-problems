#!/bin/bash

n=$1
divider=3
Prime_factors=()

while (( $((n%2)) == 0 ));
do
    n=$((n/2))
    Prime_factors+=( "2" )
done


while (( n > 1 ))
do
    if [[ $((n%divider)) -eq 0 ]]; then
        n=$((n/divider))
        Prime_factors+=( "$divider" )
    else
        ((divider+=2))
    fi
done

echo "${Prime_factors[@]}"