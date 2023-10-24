#!/bin/bash
main()
{
    a="$1"
    
    a="$(echo $a | tr -d -c [:digit:])"
    length=${#a}
    if (( length == 11 ))
    then
        if (( ${a:0:1} == 1 ))
        then
            for (( i=1; i<=11; i++ ))
            do
                string+=${a:i:1}
            done
            a=$string
        else
            echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
            exit 2
        fi
    fi
    #echo $a
    length=${#a}
    if (( length == 10 ))
    then
        n="${a:0:1}"
        if (( n >=2 && n<=9 ))
        then
                n=${a:3:1}
                if ! (( n >=2 && n<=9 ))
                then
                    echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
                    exit 2
                fi
        else
            echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
            exit 2
        fi
    else
        echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
        exit 2
    fi
    echo $a
}
main "$@"