#!/bin/bash
Sum_of_multiple()
{
    arguments="$@"
    declare -A array
    count=0
    for i in $arguments
    do
        if (( count == 0 || i == 0 ))
        then
            count=$(( count + 1 ))
            continue
        else
            for (( j = i; j < $1; j=$(( j + i )) ))
            do
                ((array[$j]++))
            done
        fi
        
    done

    sum=0
    for word in "${!array[@]}"
    do 
        sum=$(( sum + word ))
    done
    echo $sum
}

Sum_of_multiple "$@"