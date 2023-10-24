#!/bin/bash
main()
{
    for (( i=2; i<=$1; i++ ))
    do
        check=0
        for (( j=2; j<32; j++ )) #841 989 961 these are the number which are not divisible by other no that is why we are running loop till 31
        do
            if (( i != j && i%j==0 ))
            then
                check=1
                break
            fi
        done
    if (( check == 0 ))
    then
        if (( i != 2 ))
        then
            echo -n " "$i
        else
            echo -n $i
        fi
    fi
    done
}


main "$@"