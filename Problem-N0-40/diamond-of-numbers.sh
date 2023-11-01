#!/bin/bash
main ()
{
    a="$@"
    count=0
    for (( i=1; i<=a; i++ ))
    do
        for (( j=a; j>i; j-- ))
        do
            echo -n " "
        done
        echo -n $i
        for (( k=1; k<=count; k++ ))
        do
            echo -n " "
        done
        
        (( i!= 1)) && echo $i || echo ""
        (( i== 1)) && count=$(( count + 1 )) || count=$(( count + 2 ))
    done
    count=$(( count - 4 ))
    for (( l=a-1; l>=1; l-- ))
    do
        for (( m=a; m>l; m--))
        do
            echo -n " "
        done
        echo -n $l

        for (( n=1; n<=count; n++ ))
        do
            echo -n " "
        done
       
    count=$(( count - 2 ))
    (( l!= 1)) && echo $i || echo ""
    done
}

main "$@"