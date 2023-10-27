#!/bin/bash
main ()
{
    a="$@"
    ascii=$(printf "%d" "'$a")
    count=0
    for (( i=65; i<=ascii; i++ ))
    do
        for (( j=ascii; j>i; j-- ))
        do
            echo -n " "
        done
        echo -n -e "\x$(printf "%x" "$i")"
        for (( k=1; k<=count; k++ ))
        do
            echo -n " "
        done
        
        (( i!= 65)) && echo -n -e "\x$(printf "%x" "$i")"
        for (( j=ascii; j>i; j-- ))
        do
            echo -n " "
        done 
        echo ""
        (( i== 65)) && count=$(( count + 1 )) || count=$(( count + 2 ))
    done
    count=$(( count - 4 ))
    for (( l=ascii-1; l>=65; l-- ))
    do
        for (( m=ascii; m>l; m--))
        do
            echo -n " "
        done
        echo -n -e "\x$(printf "%x" "$l")"

        for (( n=1; n<=count; n++ ))
        do
            echo -n " "
        done
       
    count=$(( count - 2 ))
    (( l!= 65)) && echo -n -e "\x$(printf "%x" "$l")"
    for (( m=ascii; m>l; m--))
        do
            echo -n " "
        done
    echo ""
    done
}

main "$@"