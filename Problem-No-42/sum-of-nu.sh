#!/bin/bash
main()
{
    b="$1"
    a="$2"
    sum_of_numbers=0
    sum_of_squre=0
    for (( i=1;i<=a; i++))
    do
        sum_of_numbers=$(( sum_of_numbers + i ))
        squre=$(( i * i ))
        sum_of_squre=$(( sum_of_squre + squre ))
        
    done

    squre_of_sum_of_number=$(( sum_of_numbers * sum_of_numbers ))
    diff=$(( squre_of_sum_of_number - sum_of_squre ))
    if [ $b = "square_of_sum" ]
    then
        echo $squre_of_sum_of_number
    elif [ $b = "sum_of_squares" ]
    then
        echo $sum_of_squre
    elif [ $b = "difference" ]
    then
        echo $diff
    fi
   
}
main "$@"