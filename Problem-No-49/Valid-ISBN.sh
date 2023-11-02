#!/bin/bash
main()
{
    a="$1"
    a=$(echo $a | tr -d -c "0-9A-Z")
    len=${#a}
    if (( len != 10 ))
    then

        echo 'false'
        exit 0
    else
        count=10
        value=0
        for (( i=0; i<len; i++ ))
        do
            d=${a:$i:1}
            if [[ $d =~ [A-Z] ]]
            then
                if [ $d = "X" ]
                then
                    if (( i != len -1 ))
                    then
                        echo 'false'
                        exit 0
                    else
                        pro=$(( 10 * count ))
                        value=$(( pro + value ))
                        count=$(( count - 1 ))
                    fi
                else
                    echo 'false'
                    exit 0
                fi
            else
                pro=$(( d * count ))
                value=$(( pro + value ))
                count=$(( count - 1 ))
            fi
        done
        if (( value%11 == 0 ))
        then
            echo 'true'
        else
            echo 'false'
        fi
    fi
    
    
}
main "$@"