#!/bin/bash

main () {
    coins=("1" "2" "5" "10" "25" "100" )
    len=${#coins[@]}
    check=0
    sum=0
    while ((sum!=$1))
    do
        for (( i=len-1; i>=0; i--))
        do
            if (( $1 > ${coins[i]} ))
            then
                if (( (( sum + ${coins[i]} )) <= $1 ))
                then
                echo ${coins[i]}
                sum=$(( sum + ${coins[i]} ))
                break
                fi
                
            fi
        done
        
       (( sum == $1 )) && break
    done
    
}
main "$@"
