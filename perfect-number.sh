#!/bin/bash
main ()
{
    a="$@"
    sum=0
    if (( a <= 0 ))
    then
        echo "Classification is only possible for natural numbers."
        exit 2
    fi
    for (( i=1; i<=a/2; i++ ))
    do
        if (( a%i == 0 ))
        then
            sum=$(( sum + i ))
        fi
    done
    if (( sum == a ))
    then
        echo "perfect"
        exit 0
    elif (( sum > a ))
    then
        echo "abundant"
        exit 0
    elif (( sum < a ))
    then
        echo "deficient"
        exit 0
    fi
}
main "$@"