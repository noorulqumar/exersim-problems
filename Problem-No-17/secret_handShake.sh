#!/bin/bash

  main () {
    a=$1
    Check=""
    Binary_code=""
    code=()

    reversed_array=()
    Second_check=0

    for (( i=$a; i>0; i=$i/2 ))
    do
        reminder=$(( $i%2 ))
        Check+=$reminder
    done
 
    for (( i=$(( ${#Check} - 1 )); i>=0; i-- ))
    do  
        Binary_code+="${Check:i:1}"
    done

     
    count=1 
    for (( i=${#Binary_code} - 1; i>=0; i-- ))
    do 
        if [ "${Binary_code:$i:1}" -eq 1 ]
        then
            len=${#code[@]}
            if [ $count -eq 1 ]
            then
                code[$len]="wink"
            elif [ $count -eq 2 ]
            then
                
                code[$len]="double blink"
            elif [ $count -eq 3 ]
            then
               
                code[$len]="close your eyes"
            elif [ $count -eq 4 ]
            then
               
                code[$len]="jump"
            elif [ $count -eq 5 ]
            then

                length=${#code[@]}
                if [ "$length" -eq 0 ]
                then
                    continue
                fi

                for ((j = length - 1; j >= 0; j--)); do
                    reversed_array+=("${code[j]}")
                done
                Second_check=1
            fi
            count=$(( count + 1 ))
        else
            count=$(( count + 1 ))
            continue
        fi
        
    done
    if [ $Second_check -eq 0 ]
    then
        for (( i=0; i<${#code[@]}; i++ ))
        do
            echo -n "${code[i]}"
            (( i <= ${#code[@]} -2 )) && echo -n ","

        done
    else
        for (( i=0; i<${#reversed_array[@]}; i++ ))
        do
            echo -n "${reversed_array[i]}"
            (( i <= ${#reversed_array[@]} -2 )) && echo -n ","

        done
    fi
    exit 0
}
main "$@"
