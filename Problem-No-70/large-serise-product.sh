#!/bin/bash
main()
{
    series=$1
    span=$2

    len=${#series}
    if (( span > len ))
    then
        echo "span must be smaller than string length"
        exit 1
    elif (( span < 0 ))
    then
        echo "span must not be negative"
        exit 1
    fi
    product=0
    if [[ "$series" =~ ^[0-9]+$ ]]
    then
        for (( i=0; i<len; i++ ))
        do
            temp=1
            for (( j=i; j<i+span; j++))
            do
                digit="${series:j:1}"
                temp=$((temp * digit))
            done
            (( temp > product )) && product=$temp
        done
    else
        echo "input must only contain digits"
        exit 1
    fi
    echo "$product"
    exit 0
}

main "$@"