#!/bin/bash

if [[ "$1" -le 0 ]]
then
    echo 'Classification is only possible for natural numbers.'
    exit 1
elif [[ "$1" -eq 1 ]]
then
    echo 'deficient'
else
    sum=1
    sqrt=$(echo "scale=0; sqrt($1)" | bc -l)

    for (( i=2; i<=sqrt; ++i ))
    do
        if (( $1 % i == 0 ))
        then
            ((sum += i))
            if (( i != $1 / i ))
            then
                ((sum += $1 / i))
            fi
        fi
    done

    if [[ $sum -eq "$1" ]]
    then
        echo 'perfect'
    elif [[ $sum -gt "$1" ]]
    then
        echo 'abundant'
    else
        echo 'deficient'
    fi
fi