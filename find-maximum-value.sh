#!/bin/bash
main()
{
    a=("$@")
    len=${#a[@]}
    for (( i=1; i<len; i++ ))
    do
        string=$( echo "${a[i]}" | tr ":" " " )
        
        weight=${string[0]}
        value=${b[1]}
        echo $weight
        #echo $value
    done
}
main "$@"