#!/bin/bash
main ()
{
    a=$1
    iterations=0
    if (( a < 1 ))
    then
        echo "Error: Only positive numbers are allowed"
        exit 1
    fi
    while (( a != 1 ))
    do
        if (( a%2 == 0 ))
        then
            a=$(( a / 2 ))
        else
            a=$(( a * 3 ))
            a=$(( a + 1 ))
        fi
        iterations=$(( iterations + 1 )) 
    done
    echo $iterations
    
}

main "$@"