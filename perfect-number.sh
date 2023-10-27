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
    # sqrt=$(echo "sqrt($a)" | bc)
    for (( i=1; i<=a/2; i++ ))
    do
        if (( a%i == 0 ))
        then
            echo $i
            sum=$(( sum + i ))
        fi
    done

    echo $sum
    if (( sum == a ))
    then
        echo "perfect"
    elif (( sum > a ))
    then
        echo "abundant"
    elif (( sum < a ))
    then
        echo "deficient"
    fi
}

main "$@"