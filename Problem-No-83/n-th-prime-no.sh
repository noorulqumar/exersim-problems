#!/bin/bash
main()
{
    if (( $1 <= 0 ))
    then
        echo "invalid input"
        exit 2
    fi
    a=$1
    count=0
    for (( i=1; i<=200000; i++ ))
    do
        check=0
        for (( j=2; j<32; j++ ))
        do
            if (( i != j && i%j==0 ))
            then
                check=1
                break
            fi
        done
        
        if (( check == 0 ))
        then
            echo $i $count
            if (( count == a ))
            then
                break
            else
                count=$(( count + 1))
            fi
        fi
    done
}


main "$@"