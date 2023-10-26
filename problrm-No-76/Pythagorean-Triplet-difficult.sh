#!/bin/bash
main()
{
    a="$@"
    l=$(( a / 25 ))
    for (( i=1; i<=a/4 + l; i++ ))
    do
        for(( j=1; j<=a/2; j++ ))
        do
            for (( k=1; k<=a/2; k++ ))
            do
                if (( i + j + k == a ))
                then
                    i_squre=$(( i ** 2 ))
                    j_squre=$(( j ** 2 ))
                    k_squre=$(( k ** 2 ))
                    if (( i_squre + j_squre == k_squre ))
                    then
                        echo "$i, $j, $k"
                    fi
                fi
            done
        done
    done
}
main "$@"