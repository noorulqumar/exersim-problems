#!/bin/bash
find_response()
{
    a=$2
    b=$3
    c=$4
    type=$1
    if (( $(echo "$a <= 0" | bc -l) || $(echo "$b <= 0" | bc -l) || $(echo "$c <= 0" | bc -l) ))
     then
        echo 'false'
        exit 0
    fi

        if (( $(echo "$a + $b >= $c" | bc -l) &&  $(echo "$b + $c >= $a" | bc -l) &&  $(echo "$c + $a >= $b" | bc -l) ))
        then
            #echo "in"
            if (( $(echo "$a == $b" | bc -l) && $(echo "$c == $b" | bc -l) )) && [[ $type = "equilateral" ]]
            then
                echo 'true'
                exit 0
            elif (( $(echo "$a == $b" | bc -l) || $(echo "$b == $c" | bc -l) || $(echo "$a == $c" | bc -l) )) && [[ $type = "isosceles" ]]
            then
                echo 'true'
                exit 0
            elif (( $(echo "$a != $b" | bc -l) && $(echo "$b != $c" | bc -l) && $(echo "$a != $c" | bc -l) )) && [[ $type = "scalene" ]]
            then
                echo 'true'
                exit 0
            else
                echo 'false'
                exit 0
            fi
        else
            echo 'false'
            exit 0
        fi 
}

find_response "$@"