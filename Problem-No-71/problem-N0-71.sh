#!/bin/bash
main()
{
    a=$1
    b=$2
    if (( ${#a} == 0 ))
    then
        echo "series cannot be empty"
        exit 1
    elif (( b > ${#a} ))
    then
        echo "slice length cannot be greater than series length"
        exit 1
    elif (( b < 0 ))
    then
        echo "slice length cannot be negative"
        exit 1
    elif (( b == 0 ))
    then
        echo "slice length cannot be zero"
        exit 1
    fi
    len=$(( ${#a} - b ))
    for (( i=0; i<=len; i++))
    do
        for (( j=i; j<i+b; j++ ))
        do
            echo -n ${a:j:1}
        done
        (( i != len )) && echo -n  " " 
    done
    exit 0
}
main "$@"