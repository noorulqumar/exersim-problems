#!/bin/bash
main()
{
    a=$1
    number=""
    count=0
    for (( i=a; i>0; i=$(( i / 2 )) ))
    do
        n=$(( i % 2 ))
        reverse_number+=$n
    done

    for (( i=${#reverse_number}; i>=0; i-- ))
    do
        number+=${reverse_number:i:1}
        if [ "${reverse_number:i:1}" == 1 ]
        then
            count=$(( count + 1 ))
        fi
    done
    echo $count
}

main "$@"